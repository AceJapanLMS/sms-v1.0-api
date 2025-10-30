<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class ChangePasswordRequest extends FormRequest
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
     * @return array<string, mixed>
     */
    public function rules(): array
    {
        return [
            'id' => 'required|exists:school_users,id',
            'email' => 'required|email|exists:school_users,email',
            'current_password' => 'required|string',
            'new_password' => ['required', 'string', Password::min(6), 'different:current_password'],
            'confirm_password' => 'required|string|same:new_password',
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages(): array
    {
        return [
            'confirm_password.same' => 'The confirm password must match the new password.',
            'new_password.different' => 'The new password must be different from the current password.',
        ];
    }
}