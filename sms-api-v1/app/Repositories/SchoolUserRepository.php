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
            $userEmail = SchoolUser::where('email', $data['email'])
            ->first();
            if(!$userEmail){
                return [
                    'status' => false,
                    'message' => 'User Not Found',
                ];
            }

            $hash_password = Hash::make($data['password']);
            $user = SchoolUser::join('school_infos', 'school_users.school_info_id', '=', 'school_infos.id')
                    ->where('school_users.email', $data['email'])
                    ->where('school_infos.is_approved', 1)
                    ->select('school_users.id', 'school_users.email', 'school_infos.is_approved', 'school_users.password')
                    ->first();
                    Log::info('Sign in Result ', ['data' => $user]);
                    if(!$user){
                        return [
                            'status' => false,
                            'message' => 'Invalid email or password or school not approved'
                        ];
                    }
                    if (!Hash::check($data['password'], $user->password)) {
                        return [
                            'status' => false,
                            'message' => 'Invalid password'
                        ];
                    }
                    else{
                            return [
                                'status' => true,
                                'messsge' => 'User login scuuessfully',
                                'data' => $user
                            ];
                    }
        }catch(Throwable $e){
            report($e);
            return false;
        }
    }
}
