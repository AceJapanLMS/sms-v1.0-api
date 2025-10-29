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
            //Log::info('OTP verify query result:', ['data' => $user]);
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
            $user = SchoolUser::where('email',$data['email'])->first();
            log::info('Set New Password query result:', ['data' => $user]);
            if(!$user){
                return ['status' => false, 'message' => 'User Not Found'];
            }
            $user->password = Hash::make($data['password']);
            $user->save();
            return ['status' => true,'data' => $user];
        }catch(Throwable $e){
            report($e);
            return ['status' => false] ;
        }
    }
}
