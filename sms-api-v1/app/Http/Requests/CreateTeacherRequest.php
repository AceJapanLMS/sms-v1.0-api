<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateTeacherRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        // Route is protected by Sanctum; still allow the request here.
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
            'first_name' => 'required|string|max:100',
            'last_name' => 'required|string|max:100',
            'gender' => 'required|string|max:1',
            'nrc' => 'nullable|string|max:255',
            'birthday' => 'nullable|date',
            'phone' => 'nullable|string|max:50',
            'address' => 'nullable|string|max:255',
            'teacher_level' => 'nullable|string|max:100',
            'role' => 'nullable|string|max:100',
            'education' => 'nullable|string|max:255',
            'teacher_fees' => 'nullable|numeric',
            'username' => 'nullable|string|max:100',
            'email' => 'nullable|string|max:100',
            'password' => 'required|string|min:6',
        ];
    }

    public function messages(): array
    {
        return [
            'first_name.required' => 'First name is required.',
            'last_name.required' => 'Last name is required.',
            'password.required' => 'Password is required and must be at least 6 characters.',
        ];
    }
}
