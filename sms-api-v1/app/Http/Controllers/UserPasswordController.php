<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Interfaces\SchoolUserRepositoryInterface;
use App\Http\Requests\SetNewUserPasswordRequest;
use App\Responses\ApiResponse;

class UserPasswordController extends Controller
{
    protected SchoolUserRepositoryInterface $schoolusers;
    public function __construct(SchoolUserRepositoryInterface $schoolusers){
        $this->schoolusers = $schoolusers;
    }

    public function setNewUserPassword(SetNewUserPasswordRequest $request){
        $result = $this->schoolusers->setNewPassword($request->validated());

        if($result['status'] === true){
            return ApiResponse::sendResponse($result['data'],'Set a new password created successfully', 200);
        }
        else{
            return ApiResponse::sendResponseFailed(null, $result['message'],400);
        }
    }
}
