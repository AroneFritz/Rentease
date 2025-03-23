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
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Basel\MyFatoorah\MyFatoorah;

class MyFatoorahController extends Controller
{
    use MiscellaneousTrait;

    public $myfatoorah;

    public function __construct()
    {
        $info = OnlineGateway::where('keyword', 'myfatoorah')->first();
        $information = json_decode($info->information, true);
        $this->myfatoorah = MyFatoorah::getInstance($information['sandbox_status'] == 1 ? true : false);
    }

    public function bookingProcess(Request $request)
    {
        $roomBooking = new RoomBookingController();
        // do calculation
        $calculatedData = $roomBooking->calculation($request);
        $available_currency = array('KWD', 'SAR', 'BHD', 'AED', 'QAR', 'OMR', 'JOD');
        $currencyInfo = MiscellaneousTrait::getCurrencyInfo();
        // checking whether the base currency is allowed or not
        if (!in_array($currencyInfo->base_currency_text, $available_currency)) {
            return redirect()->back()->with('error', 'Invalid currency for myfatoorah payment.');
        }

        $information['subtotal'] = $calculatedData['subtotal'];
        $information['discount'] = $calculatedData['discount'];
        $information['total'] = $calculatedData['total'];
        $information['currency_symbol'] = $currencyInfo->base_currency_symbol;
        $information['currency_symbol_position'] = $currencyInfo->base_currency_symbol_position;
        $information['currency_text'] = $currencyInfo->base_currency_text;
        $information['currency_text_position'] = $currencyInfo->base_currency_text_position;
        $information['method'] = 'Myfatoorah';
        $information['type'] = 'online';

        /***************************************************
         ************** Payment gateway info **************
         ***************************************************/
        $payAmount = intval($calculatedData['total']);
        $info = OnlineGateway::where('keyword', 'myfatoorah')->first();
        $payInfo = json_decode($info->information, true);
        $random_1 = rand(999, 9999);
        $random_2 = rand(9999, 99999);
        $result = $this->myfatoorah->sendPayment(
            $request->customer_name,
            $payAmount,
            [
                'CustomerMobile' => $payInfo['sandbox_status'] == 1 ? '56562123544' : $request->customer_email,
                'CustomerReference' => "$random_1",  //orderID
                'UserDefinedField' => "$random_2", //clientID
                "InvoiceItems" => [
                    [
                        "ItemName" => "Room Bookings",
                        "Quantity" => 1,
                        "UnitPrice" => $payAmount
                    ]
                ]
            ]
        );
        if ($result && $result['IsSuccess'] == true) {
            Session::put('myfatoorah_payment_type', 'room');
            // store the room booking information in database
            $booking_details = $roomBooking->storeData($request, $information);
            // put some data in session before redirect
            Session::put('bookingId', $booking_details->id);   // db row number
            return redirect($result['Data']['InvoiceURL']);
        } else {
            return redirect()->back()->with('error', 'The Payment has been canceled');
        }
    }

    public function notify(Request $request)
    {
        // get the information from Session
        $bookingId = Session::get('bookingId');
        if (!empty($request->paymentId)) {
            // update the payment status for room booking in database
            $bookingInfo = RoomBooking::where('id', $bookingId)->first();

            $bookingInfo->update(['payment_status' => 1]);

            $roomBooking = new RoomBookingController();

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

            // remove all session data
            Session::forget('bookingId');

            return route('room_booking.complete');
        } else {
            return route('room_booking.cancel');
        }
    }
}
