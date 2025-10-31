<?php

namespace App\Repositories;

use App\Interfaces\SchoolUserRepositoryInterface;
use App\Models\SchoolUser;
use App\Models\SchoolInfo;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Hash;
use Throwable;

class SchoolUserRepository implements SchoolUserRepositoryInterface
{
    public function verifyOtp(array $data)
    {
        try {
            $user = SchoolUser::where('email', $data['email'])->first();
            Log::info('OTP verify query result:', ['data' => $user]);
            if(!$user){
                return false;
            }
            if($user->otp == $data['otp']){
                $user->save();
             //Update is_approved
             $schoolInfo = SchoolInfo::find($user->school_info_id);
             if($schoolInfo){
                $schoolInfo->is_approved = 1;
                $schoolInfo->save();
                return $user;
             }
            } else {
                $user = null;
                return $user;
            }
        } catch (Throwable $e) {
            report($e);
            return null;
        }
    }
    public function setNewPassword(array $data){
        try{
            $user = SchoolUser::where('email', $data['email'])->first();
            Log::info('result:', ['data' => $user]);

            if(!$user){
                return ['status' => false, 'message' => 'User Not Found'];
            }

            if ($data['password'] !== $data['confirm_password']) {
                return [
                    'status' => false,
                    'message' => 'Password and confirm password do not match'
                ];
            }

            $user->password = Hash::make($data['password']);
            $user->save();
            return ['status' => true,'data' => $user];
        }catch(Throwable $e){
            report($e);
            return ['status' => false] ;
        }
    }

    public function sign(array $data){
        try{
            $inputtedSignedAttempts=$data['signin_attempts']; // initially assume that 0
            // Ensure the user exists
            $user = SchoolUser::where('email', $data['email'])->first();
            if (!$user) {
                return [
                    'status' => false,
                    'message' => 'User Not Found',
                ];
            }
            // check user is already locked in database
            if ($user->is_locked === 1) {
                //saving every sign_attempts that provided by mobile side.
                $user->signin_attempts=$inputtedSignedAttempts;
                $user->save();
                return [
                    'status' => false,
                    'message' => 'Your account is locked by the system.please try again later',
                ];
            }
            // Ensure the associated school is approved
            $schoolInfo = SchoolInfo::find($user->school_info_id);
            if (! $schoolInfo || $schoolInfo->is_approved != 1) {
                return [
                    'status' => false,
                    'message' => 'Invalid email or password or school not approved',
                ];
            }
            // Verify password
            if (! Hash::check($data['password'], $user->password)) {
                //saving every sign_attempts that provided by mobile side.
                $user->signin_attempts=$inputtedSignedAttempts;
                $user->save();
                //locked the user's account when sign attempts is greater than 5 times
                if($user->signin_attempts>=5){
                    $user->is_locked=true;
                    //locked the account because of sign attempts rule.
                    $user->save();
                }
                return [
                    'status' => false,
                    'message' => 'Invalid password',
                ];
            }
            // Create a Sanctum token for API auth
            $token = $user->createToken('api-token')->plainTextToken;
            return [
                'status' => true,
                'message' => 'User login successfully',
                'data' => [
                    'user' => $user,
                    'token' => $token,
                ],
            ];
        }catch(Throwable $e){
            report($e);
            return ['status' => false, 'message' => 'Server error'];
        }
    }

    public function getUserByEmail(array $data)
    {
        $user = SchoolUser::where('email', $data['email'])->first();
        if(!$user){
            return ['status' => false, 'message' => 'User Not Found'];
        }
        return $user;
    }
}
