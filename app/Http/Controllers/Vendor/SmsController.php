<?php

namespace App\Http\Controllers\Vendor;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Twilio\Rest\Client;

class SmsController extends Controller
{
    public function showSmsForm()
    {
        return view('vendors.sms'); // Returns the SMS form
    }

    public function sendSms(Request $request)
    {
        // Validate the phone number and message
        $request->validate([
            'phone_number' => 'required|string|regex:/^\+?[1-9]\d{1,14}$/', // Validate E.164 format
            'message' => 'required|string|max:1600', // Validate max SMS length
        ]);

        // Get Twilio credentials from the .env file
        $sid = env('TWILIO_SID');
        $auth_token = env('TWILIO_AUTH_TOKEN');
        $twilio_number = env('TWILIO_PHONE_NUMBER');

        try {
            // Initialize Twilio client
            $client = new Client($sid, $auth_token);

            // Send SMS
            $client->messages->create(
                $request->input('phone_number'), // Recipient's number
                [
                    'from' => $twilio_number, // Twilio phone number
                    'body' => $request->input('message'), // SMS content
                ]
            );

            // Redirect back with a success message
            return redirect()->route('vendor.sendSms')->with('success', 'SMS sent successfully!');
        } catch (\Exception $e) {
            // Handle errors gracefully
            return back()->withErrors([
                'error' => 'Failed to send SMS. Details: ' . $e->getMessage(),
            ]);
        }
    }
}
