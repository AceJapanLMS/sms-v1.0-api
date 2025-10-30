<?php

namespace App\Http\Controllers;

use App\Interfaces\SchoolUserRepositoryInterface;
use App\Http\Requests\SignRequest;
use App\Responses\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Str;

class SignInController extends Controller
{
    protected SchoolUserRepositoryInterface $schoolusers;

    public function __construct(SchoolUserRepositoryInterface $schoolusers){
        $this->schoolusers = $schoolusers;
    }

    /**
     * Authenticate a school user and issue a token.
     */
    public function login(SignRequest $request): JsonResponse
    {
        // Rate limiting: 5 attempts per minute per IP
        $key = Str::lower($request->input('email')).'|'.$request->ip();

        if (RateLimiter::tooManyAttempts($key, 5)) {
            $seconds = RateLimiter::availableIn($key);
            return ApiResponse::sendResponseFailed(null,"Too many login attempts. Please try again in {$seconds} seconds.",429);
        }
        $result = $this->schoolusers->sign($request->validated());
        if (!isset($result['status'])) {
            RateLimiter::hit($key);
            return ApiResponse::sendResponseFailed(null, 'Unexpected error', 500);
        }
        if ($result['status'] === false) {
            RateLimiter::hit($key);
            return ApiResponse::sendResponseFailed(null, $result['message'] ?? 'Login Failed', 401);
        }
        // Clear failed attempts on success
        RateLimiter::clear($key);
        // Separate token from user data in response
        $response = [
            'user' => $result['data']['user'],
            'access_token' => $result['data']['token'],
            'token_type' => 'Bearer'
        ];
        return ApiResponse::sendResponse($response, 'Login successful', 200);
    }

    /**
     * Logout the current user (revoke token).
     */
    public function logout(Request $request): JsonResponse
    {
        // Revoke all tokens...
        if ($request->user()) {
            $request->user()->tokens()->delete();
        }
        return ApiResponse::sendResponse([], 'Successfully logged out', 200);
    }
}
