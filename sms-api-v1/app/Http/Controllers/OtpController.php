<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Interfaces\SchoolUserRepositoryInterface;
use App\Http\Requests\VerifyOtpRequest;
use App\Responses\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;

class OtpController extends Controller
{
    protected SchoolUserRepositoryInterface $schoolusers;
    public function __construct(SchoolUserRepositoryInterface $schoolusers){
        $this->schoolusers = $schoolusers;
    }
    public function store(VerifyOtpRequest $request): JsonResponse{
        $verified = $this->schoolusers->verifyOtp($request->validated());
        //Log::info('OTP verify query result:', ['verified' => $verified]);
        if($verified === false){
            return ApiResponse::sendResponseFailed(null, 'User Not Found',404);
        }
        else if(is_null($verified)){
            return ApiResponse::sendResponseFailed(null, 'OTP Verified failed');
        }
        else if($verified){
            return ApiResponse::sendResponse($verified, 'OTP Verified Successfully',200);
        }
    }
}


