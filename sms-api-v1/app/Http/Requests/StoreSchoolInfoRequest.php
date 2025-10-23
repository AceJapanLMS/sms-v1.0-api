<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoreSchoolInfoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
{
    return [
        'school_name'       => 'required|string|max:255',
        'school_level'      => 'required|string|max:255',
        'contact_phone_no'  => 'required|string|max:255',
        'contact_email'     => 'required|email|max:255',
        'city_id'           => 'required|integer',
        'township_id'       => 'required|integer',
        'address_detail'    => 'required|string|max:255',
    ];
}
}
