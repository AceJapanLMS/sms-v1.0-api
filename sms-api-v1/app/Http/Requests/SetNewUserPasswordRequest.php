<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SetNewUserPasswordRequest extends FormRequest{
    public function authorize(){
        return true;
    }
    public function rules(){
        return [
            'email'             => 'required|string|max:255',
            'password'          => 'required|string|max:255',
            'confirm_password'  => 'required|same:password',
        ];
    }

    public function messages(): array{
        return [
            'confirm_password.same' => 'Password and Confirm Password do not match',
        ];
    }
}