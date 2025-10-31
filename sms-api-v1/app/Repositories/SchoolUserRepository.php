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
            // Keep your join query to fetch user and school info
            $joinedUser = SchoolUser::join('school_infos', 'school_users.school_info_id', '=', 'school_infos.id')
                ->where('school_users.email', $data['email'])
                ->where('school_infos.is_approved', 1)
                ->select(
                    'school_users.id',
                    'school_users.email',
                    'school_infos.is_approved',
                    'school_users.password',
                    'school_users.signin_attempts',
                    'school_users.is_remember_me',
                    'school_users.is_locked'
                )
                ->first();
                Log::info('result:', ['data' => $joinedUser]);
            if(!$joinedUser){
                return [
                    'status' => false,
                    'message' => 'Invalid email or password or school not approved'
                ];
            }

            // Load real SchoolUser model to update fields
            $user = SchoolUser::find($joinedUser->id);

            // Check if account is locked
            if($user->is_locked){
                return [
                    'status' => false,
                    'message' => 'Your account is locked'
                ];
            }
            // Check password
            if(!Hash::check($data['password'], $user->password)){
                // Lock account if attempts >= 5
                if($user->signin_attempts > 5){
                    $user->is_locked = 1;
                }
                $user->signin_attempts = $data['signin_attempts'];
                $user->save();
                return [
                    'status' => false,
                    'message' => $user->is_locked ? 'Your account is locked' : 'Invalid password',
                    'data' => [
                        'id' => $user->id,
                        'email' => $user->email,
                        'signin_attempts' => $user->signin_attempts,
                        'is_locked' => $user->is_locked
                    ]
                ];
            }

            // Successful login
            $user->signin_attempts = 0;

            // Save is_remember_me if provided
            if(isset($data['is_remember_me'])){
                $user->is_remember_me = $data['is_remember_me'] ? 1 : 0;
            }

            $user->save();

            return [
                'status' => true,
                'message' => 'User login successfully',
                'data' => [
                    'id' => $user->id,
                    'email' => $user->email,
                    'is_approved' => $joinedUser->is_approved,
                    'signin_attempts' => $user->signin_attempts,
                    'is_remember_me' => $user->is_remember_me,
                    'is_locked' => $user->is_locked
                ]
            ];

        }catch(Throwable $e){
            report($e);
            return [
                'status' => false,
                'message' => 'Server error'
            ];
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
