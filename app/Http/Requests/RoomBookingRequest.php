<?php

namespace App\Http\Requests;

use App\Rules\IsRoomAvailableRule;
use Illuminate\Foundation\Http\FormRequest;

class RoomBookingRequest extends FormRequest
{
  /**
   * Determine if the user is authorized to make this request.
   *
   * @return bool
   */
  public function authorize()
  {
    return true;
  }

  /**
   * Get the validation rules that apply to the request.
   *
   * @return array
   */
  public function rules()
  {
    $ruleArray = [
      'dates' => [
        'required',
        new IsRoomAvailableRule($this->room_id)
      ],
      'nights' => 'required',
      'guests' => 'required|numeric|min:1',
      'customer_name' => 'required',
      'customer_phone' => 'required',
      'customer_email' => 'required|email:rfc,dns'
    ];

    if ($this->paymentType == 'stripe') {
      $ruleArray['stripeToken'] = 'required';
    }
    if ($this->paymentType == 'iyzico') {
      $ruleArray['city'] = 'required';
      $ruleArray['country'] = 'required';
      $ruleArray['address'] = 'required';
      $ruleArray['zip_code'] = 'required';
      $ruleArray['identity_number'] = 'required';
    }
    if ($this->paymentType == 'authorizenet') {
      $ruleArray['opaqueDataDescriptor'] = 'required';
      $ruleArray['opaqueDataValue'] = 'required';
    }

    return $ruleArray;
  }
}
