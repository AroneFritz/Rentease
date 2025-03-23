<?php

namespace App\Http\Controllers\FrontEnd\Room;

use App\Http\Controllers\Controller;
use App\Http\Controllers\FrontEnd\Room\RoomBookingController;
use App\Models\Commission;
use App\Models\Earning;
use App\Models\PaymentGateway\OnlineGateway;
use App\Models\RoomManagement\Room;
use App\Models\RoomManagement\RoomBooking;
use App\Models\Vendor;
use App\Traits\MiscellaneousTrait;
use Cartalyst\Stripe\Exception\CardErrorException;
use Cartalyst\Stripe\Exception\UnauthorizedException;
use Cartalyst\Stripe\Stripe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;

class StripeController extends Controller
{
  public function __construct()
  {
    $data = OnlineGateway::whereKeyword('stripe')->first();
    $stripeConf = json_decode($data->information, true);

    Config::set('services.stripe.key', $stripeConf["key"]);
    Config::set('services.stripe.secret', $stripeConf["secret"]);
  }

  public function bookingProcess(Request $request)
  {
    $roomBooking = new RoomBookingController();

    // do calculation
    $calculatedData = $roomBooking->calculation($request);

    $currencyInfo = MiscellaneousTrait::getCurrencyInfo();

    $information['subtotal'] = $calculatedData['subtotal'];
    $information['discount'] = $calculatedData['discount'];
    $information['total'] = $calculatedData['total'];
    $information['currency_symbol'] = $currencyInfo->base_currency_symbol;
    $information['currency_symbol_position'] = $currencyInfo->base_currency_symbol_position;
    $information['currency_text'] = $currencyInfo->base_currency_text;
    $information['currency_text_position'] = $currencyInfo->base_currency_text_position;
    $information['method'] = 'Stripe';
    $information['type'] = 'online';

    // store the room booking information in database
    $booking_details = $roomBooking->storeData($request, $information);

    // changing the currency before redirect to PayPal
    if ($currencyInfo->base_currency_text !== 'USD') {
      $rate = $currencyInfo->base_currency_rate;
      $convertedTotal = round(($calculatedData['total'] / $rate), 2);
    }

    $stripeTotal = $currencyInfo->base_currency_text === 'USD' ? $calculatedData['total'] : $convertedTotal;

    try {
      // initialize stripe
      $stripe = Stripe::make(Config::get('services.stripe.secret'));

      try {
        // generate token
        $token = $request->stripeToken;
        // generate charge
        $charge = $stripe->charges()->create([
          'source' => $token,
          'currency' => 'USD',
          'amount'   => $stripeTotal
        ]);

        if ($charge['status'] == 'succeeded') {
          // update the payment status for room booking in database
          $bookingInfo = RoomBooking::where('id', $booking_details->id)->first();

          $bookingInfo->update(['payment_status' => 1]);

          // generate an invoice in pdf format
          $invoice = $roomBooking->generateInvoice($bookingInfo);

          $room = Room::where('id', $bookingInfo->room_id)->first();
          if (!empty($room)) {
            if ($room->vendor_id != NULL) {
              $vendor_id = $room->vendor_id;
            } else {
              $vendor_id = NULL;
            }
          } else {
            $vendor_id = NULL;
          }

          //calculate commission
          $percent = Commission::select('room_booking_commission')->first();

          $commission = (($bookingInfo->grand_total) * $percent->room_booking_commission) / 100;

          //get vendor
          $vendor = Vendor::where('id', $vendor_id)->first();

          //add blance to admin revinue
          $earning = Earning::first();

          $earning->total_revenue = $earning->total_revenue + $bookingInfo->grand_total;
          if ($vendor) {
            $earning->total_earning = $earning->total_earning + $commission;
          } else {
            $earning->total_earning = $earning->total_earning + $bookingInfo->grand_total;
          }
          $earning->save();

          //store Balance  to vendor
          if ($vendor) {
            $pre_balance = $vendor->amount;
            $vendor->amount = $vendor->amount + ($bookingInfo->grand_total - ($commission));
            $vendor->save();
            $after_balance = $vendor->amount;

            $received_amount = ($bookingInfo->grand_total - ($commission));

            // then, update the invoice field info in database
            $bookingInfo->update([
              'invoice' => $invoice,
              'comission' => $commission,
              'received_amount' => $received_amount,
            ]);
          } else {
            // then, update the invoice field info in database
            $bookingInfo->update([
              'invoice' => $invoice
            ]);
            $received_amount = $bookingInfo->grand_total;
            $after_balance = NULL;
            $pre_balance = NULL;
          }
          //calculate commission end
          $data = [
            'transcation_id' => time(),
            'booking_id' => $bookingInfo->id,
            'transcation_type' => 1,
            'user_id' => null,
            'vendor_id' => $vendor_id,
            'payment_status' => 1,
            'payment_method' => $bookingInfo->payment_method,
            'grand_total' => $bookingInfo->grand_total,
            'commission' => $bookingInfo->comission,
            'pre_balance' => $pre_balance,
            'after_balance' => $after_balance,
            'gateway_type' => $bookingInfo->gateway_type,
            'currency_symbol' => $bookingInfo->currency_symbol,
            'currency_symbol_position' => $bookingInfo->currency_symbol_position,
          ];
          store_transaction($data);

          // send a mail to the customer with an invoice
          $roomBooking->sendMail($bookingInfo);

          return redirect()->route('room_booking.complete');
        } else {
          return redirect()->route('room_booking.cancel');
        }
      } catch (CardErrorException $e) {
        session()->flash('error', $e->getMessage());

        return redirect()->route('room_booking.cancel');
      }
    } catch (UnauthorizedException $e) {
      session()->flash('error', $e->getMessage());

      return redirect()->route('room_booking.cancel');
    }
  }
}
