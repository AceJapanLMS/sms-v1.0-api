<?php

namespace App\Http\Controllers;

use App\Http\Requests\ChangePasswordRequest;
use App\Models\SchoolUser;
use App\Responses\ApiResponse;
use Illuminate\Support\Facades\Hash;

class ChangePasswordController extends Controller
{
    /**
     * Change user password
     *
     * @param ChangePasswordRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(ChangePasswordRequest $request)
    {
        $user = SchoolUser::where('id', $request->id)->where('email', $request->email)->first();

        if (!$user) {
            return ApiResponse::sendResponseFailed([], 'User not found');
        }

        // Verify current password
        if (!Hash::check($request->current_password, $user->password)) {
            return ApiResponse::sendResponseFailed([], 'Current password is incorrect');
        }

        try {
            $user->password = $request->new_password;
            $user->save();
            return ApiResponse::sendResponse([], 'Password changed successfully');
        } catch (\Exception $e) {
            return ApiResponse::sendResponseFailed([], 'Failed to change password'
            );
        }
    }
}
