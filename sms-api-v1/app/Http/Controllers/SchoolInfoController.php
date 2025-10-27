<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreSchoolInfoRequest;
use App\Interfaces\SchoolInfoRepositoryInterface;
use App\Interfaces\SendOtpEmailRepositoryInterface;
use App\Http\Requests\UpdateSchoolInfoRequest;
use App\Mail\OtpMail;
use App\Responses\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Mail;

class SchoolInfoController extends Controller
{
    protected SchoolInfoRepositoryInterface $schoolinfos;
    protected SendOtpEmailRepositoryInterface $sendOtpEmailRepository;

    public function __construct(SchoolInfoRepositoryInterface $schoolinfos, SendOtpEmailRepositoryInterface $sendOtpEmailRepository){
        $this->schoolinfos = $schoolinfos;
        $this->sendOtpEmailRepository = $sendOtpEmailRepository;
    }
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        $data = $this->schoolinfos->getAll();
        return ApiResponse::sendResponse($data,'',200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreSchoolInfoRequest $request): JsonResponse
    {
        $result = $this->schoolinfos->create($request->validated());
        
        // Check for validation errors from repository
        if (is_array($result) && isset($result['error'])) {
            return ApiResponse::sendResponseFailed(null, $result['error']);
        }
        
        // Save OTP and get SchoolUser instance
        $schoolUser = $this->sendOtpEmailRepository->saveSchoolUser([
            'school_info_id' => $result->id,
            'email' => $result->contact_email
        ]);
        
        // Prepare mail data
        $mailData = [
            'title' => 'Verify OTP for the school registration process',
            'otp' => $schoolUser->otp,
            'school_name' => $result->school_name
        ];
        
        // Send OTP email
        Mail::to($result->contact_email)->send(new OtpMail($mailData));
        
        // Return response without exposing the OTP
        $result->otp_expires_at = $schoolUser->expired_at;
        return ApiResponse::sendResponse($result, 'School Info Created and OTP sent to email', 201);
    }
    /**
     * Display the specified resource.
     */
    public function show($id): JsonResponse
    {
        $data = $this->schoolinfos->getById($id);
        return ApiResponse::sendResponse($data,'',200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateSchoolInfoRequest $request, string $id): JsonResponse
    {
        $schoolinfo = $this->schoolinfos->update($id, $request->validated());
        return ApiResponse::sendResponse($schoolinfo,'School Info updated',200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id): Response
    {
        $this->schoolinfos->delete($id);
        return ApiResponse::sendResponse(null,'School info deleted',204);
    }
}
