<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Responses\ApiResponse;
use Illuminate\Http\JsonResponse;

class UserProfileController extends Controller
{
    /**
     * Return the authenticated user's profile.
     */
    public function show(Request $request): JsonResponse
    {
        $user = $request->user();

        if (! $user) {
            return ApiResponse::sendResponseFailed(null, 'Unauthenticated', 401);
        }

        return ApiResponse::sendResponse($user, 'Profile retrieved', 200);
    }

    /**
     * Update the authenticated user's profile (safe fields only).
     */
    public function update(Request $request): JsonResponse
    {
        $user = $request->user();
        if (! $user) {
            return ApiResponse::sendResponseFailed(null, 'Unauthenticated', 401);
        }

        $data = $request->validate([
            'email' => 'sometimes|email',
            // add additional updatable fields as needed
        ]);

        $user->fill($data);
        $user->save();

        return ApiResponse::sendResponse($user, 'Profile updated', 200);
    }
}
