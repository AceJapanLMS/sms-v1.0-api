<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SignRequest extends FormRequest{
    public function authorize(): bool{
        return true;
    }

    public function rules(): array{
        return [
            'email'=> 'required|string|max:255',
            'password'=> 'required|string|max:255',
            'is_remember_me'=> 'required|boolean',
            'signin_attempts'=> 'required|integer',
        ];
    }
}
