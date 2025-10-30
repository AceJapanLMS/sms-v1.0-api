<?php

namespace App\Http\Controllers;

use App\Http\Requests\ReSendOTPRequest;
use App\Interfaces\SchoolInfoRepositoryInterface;
use App\Interfaces\SchoolUserRepositoryInterface;
use App\Interfaces\SendOtpEmailRepositoryInterface;
use App\Mail\OtpMail;
use App\Responses\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Mail;

class MailController extends Controller
{
    protected  SchoolInfoRepositoryInterface $schoolInfoRepository;
    protected SendOtpEmailRepositoryInterface $sendOtpEmailRepository;
    protected SchoolUserRepositoryInterface $schoolUserRepository;

    public function __construct(SchoolInfoRepositoryInterface $schoolInfoRepository, SendOtpEmailRepositoryInterface $sendOtpEmailRepository, SchoolUserRepositoryInterface $schoolUserRepository){
        $this->$schoolInfoRepository = $schoolInfoRepository;
        $this->sendOtpEmailRepository = $sendOtpEmailRepository;
        $this->schoolUserRepository = $schoolUserRepository;
    }
    /**
     * Store a newly created resource in storage.
     */
    public function resendOTP(ReSendOTPRequest $request): JsonResponse
    {
        $schoolUser=$this->schoolUserRepository->getUserByEmail($request->validated());
        if ($schoolUser['status'] === false) {
            return ApiResponse::sendResponseFailed(null, $schoolUser['message'], 401);
        }
        else {
            $schoolInfo = $this->schoolInfoRepository->getByEmail($schoolUser['email']);

            // update OTP and get SchoolUser instance
            $schoolUser = $this->sendOtpEmailRepository->updateSchoolUser([
                'school_info_id' => $schoolInfo->id,
                'email' => $schoolInfo->contact_email
            ]);

            // Prepare mail data
            $mailData = [
                'title' => 'Verify OTP for the school registration process',
                'otp' => $schoolUser->otp,
                'school_name' => $schoolInfo->school_name
            ];

            // Send OTP email
            Mail::to($schoolInfo->contact_email)->send(new OtpMail($mailData));

            // Return response without exposing the OTP
            $schoolInfo->otp_expires_at = $schoolUser->expired_at;
            return ApiResponse::sendResponse($schoolInfo, 'OTP was sent again successfully', 200);
        }
    }
}
