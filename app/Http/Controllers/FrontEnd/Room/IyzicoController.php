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
use Config\Iyzipay;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class IyzicoController extends Controller
{
    use MiscellaneousTrait;

    private $gateway_information;

    public function __construct()
    {
        $data = OnlineGateway::whereKeyword('iyzico')->first();
        $information = json_decode($data->information, true);

        $this->gateway_information = $information;
    }

    public function bookingProcess(Request $request)
    {
        $fname = $request->customer_name;
        $lname = $request->customer_name;
        $email = $request->customer_email;
        $phone_number = $request->customer_phone;

        $city = $request->city;
        $country = $request->country;
        $address = $request->address;
        $zip_code = $request->zip_code;

        $identity_number = $request->identity_number;

        $conversion_id = uniqid(9999, 999999);
        $basket_id = 'B' . uniqid(999, 99999);

        $roomBooking = new RoomBookingController();
        // do calculation
        $calculatedData = $roomBooking->calculation($request);
        $available_currency = array('TRY');
        $currencyInfo = MiscellaneousTrait::getCurrencyInfo();
        // checking whether the base currency is allowed or not
        if (!in_array($currencyInfo->base_currency_text, $available_currency)) {
            Session::flash('error', 'Invalid currency for iyzico payment.');
            return redirect()->back()->withInput();
        }

        $information['subtotal'] = $calculatedData['subtotal'];
        $information['discount'] = $calculatedData['discount'];
        $information['total'] = $calculatedData['total'];
        $information['currency_symbol'] = $currencyInfo->base_currency_symbol;
        $information['currency_symbol_position'] = $currencyInfo->base_currency_symbol_position;
        $information['currency_text'] = $currencyInfo->base_currency_text;
        $information['currency_text_position'] = $currencyInfo->base_currency_text_position;
        $information['method'] = 'Iyzico';
        $information['type'] = 'online';
        $information['conversation_id'] = $conversion_id;

        $notify_url = route('room_booking.iyzico.notify');
        /***************************************************
         ************** Payment gateway info **************
         ***************************************************/

        $options = Iyzipay::options();
        # create request class
        $i_request = new \Iyzipay\Request\CreatePayWithIyzicoInitializeRequest();
        $i_request->setLocale(\Iyzipay\Model\Locale::EN);
        $i_request->setConversationId($conversion_id);
        $i_request->setPrice($calculatedData['total']);
        $i_request->setPaidPrice($calculatedData['total']);
        $i_request->setCurrency(\Iyzipay\Model\Currency::TL);
        $i_request->setBasketId($basket_id);
        $i_request->setPaymentGroup(\Iyzipay\Model\PaymentGroup::PRODUCT);
        $i_request->setCallbackUrl($notify_url);
        $i_request->setEnabledInstallments(array(2, 3, 6, 9));

        $buyer = new \Iyzipay\Model\Buyer();
        $buyer->setId(uniqid());
        $buyer->setName($fname);
        $buyer->setSurname($lname);
        $buyer->setGsmNumber($phone_number);
        $buyer->setEmail($email);
        $buyer->setIdentityNumber($identity_number);
        $buyer->setLastLoginDate("");
        $buyer->setRegistrationDate("");
        $buyer->setRegistrationAddress($address);
        $buyer->setIp("");
        $buyer->setCity($city);
        $buyer->setCountry($country);
        $buyer->setZipCode($zip_code);
        $i_request->setBuyer($buyer);

        $shippingAddress = new \Iyzipay\Model\Address();
        $shippingAddress->setContactName($fname);
        $shippingAddress->setCity($city);
        $shippingAddress->setCountry($country);
        $shippingAddress->setAddress($address);
        $shippingAddress->setZipCode($zip_code);
        $i_request->setShippingAddress($shippingAddress);

        $billingAddress = new \Iyzipay\Model\Address();
        $billingAddress->setContactName($fname);
        $billingAddress->setCity($city);
        $billingAddress->setCountry($country);
        $billingAddress->setAddress($address);
        $billingAddress->setZipCode($zip_code);
        $i_request->setBillingAddress($billingAddress);

        $q_id = uniqid(999, 99999);
        $basketItems = array();
        $firstBasketItem = new \Iyzipay\Model\BasketItem();
        $firstBasketItem->setId($q_id);
        $firstBasketItem->setName("Booking Id " . $q_id);
        $firstBasketItem->setCategory1("Room Booking");
        $firstBasketItem->setCategory2("");
        $firstBasketItem->setItemType(\Iyzipay\Model\BasketItemType::PHYSICAL);
        $firstBasketItem->setPrice($calculatedData['total']);
        $basketItems[0] = $firstBasketItem;
        $i_request->setBasketItems($basketItems);

        # make request
        $payWithIyzicoInitialize = \Iyzipay\Model\PayWithIyzicoInitialize::create($i_request, $options);

        $paymentResponse = (array)$payWithIyzicoInitialize;
        foreach ($paymentResponse as $key => $data) {
            $paymentInfo = json_decode($data, true);
            if ($paymentInfo['status'] == 'success') {
                if (!empty($paymentInfo['payWithIyzicoPageUrl'])) {
                    // store the room booking information in database
                    $booking_details = $roomBooking->storeData($request, $information);

                    // put some data in session before redirect
                    Session::put('bookingId', $booking_details->id);   // db row number

                    return redirect($paymentInfo['payWithIyzicoPageUrl']);
                } else {
                    return redirect()->back()->with('error', 'The Payment has been canceled');
                }
            } else {
                return redirect()->back()->with('error', 'The Payment has been canceled');
            }
        }
    }

    public function notify(Request $request)
    {
        // remove all session data
        Session::forget('bookingId');
        return redirect()->route('room_booking.complete');
    }

    public function updatePayment($bookingId)
    {
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
    }
}
