<?php

namespace App\Repositories;

use App\Interfaces\SendOtpEmailRepositoryInterface;
use App\Models\SchoolUser;
use Carbon\Carbon;

class SendOtpEmailRepository implements SendOtpEmailRepositoryInterface
{
    public function saveSchoolUser(array $data)
    {
        // Generate a random 6-digit OTP
        $otp = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);

        // Create SchoolUser with OTP
        return SchoolUser::create([
            'school_info_id' => $data['school_info_id'],
            'email' => $data['email'],
            'otp' => $otp,
            'expired_at' => Carbon::now()->addMinutes(15) // OTP expires in 15 minutes
        ]);
    }

    public function updateSchoolUser(array $data)
    {
        // Generate a random 6-digit OTP
        $otp = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);

        // Create SchoolUser with OTP
        return SchoolUser::update([
            'school_info_id' => $data['school_info_id'],
            'email' => $data['email'],
            'otp' => $otp,
            'expired_at' => Carbon::now()->addMinutes(15) // OTP expires in 15 minutes
        ]);
    }
}
