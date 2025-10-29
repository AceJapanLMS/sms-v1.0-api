<?php

namespace App\Http\Controllers;

use App\Interfaces\SchoolUserRepositoryInterface;
use App\Http\Requests\SignRequest;
use App\Responses\ApiResponse;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;

use Illuminate\Http\Request;

class SignInController extends Controller
{
    protected SchoolUserRepositoryInterface $schoolusers;

    public function __construct(SchoolUserRepositoryInterface $schoolusers){
        $this->schoolusers = $schoolusers;
    }

    public function sign(SignRequest $request): JsonResponse{
        $result = $this->schoolusers->sign($request->validated());
        //Log::info('Sign-in result:', ['result' => $result]);
        if (!isset($result['status'])) {
            return ApiResponse::sendResponseFailed(null, 'Unexpected error', 500);
        }
        if ($result['status'] === false) {
            return ApiResponse::sendResponseFailed(null, $result['message'] ?? 'Login Failed', 401);
        }
        return ApiResponse::sendResponse($result['data'], $result['message'] ?? 'Login success', 200);
    }
    }
