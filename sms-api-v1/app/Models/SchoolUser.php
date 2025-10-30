<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;

class SchoolUser extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\SchoolUserFactory> */
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'school_info_id',
        'email',
		'otp',
        'password',
        'expired_at',
    ];

    protected $hidden = [
        'otp',
        'password',
        'remember_token',
    ];

    protected $casts = [
        'expired_at' => 'datetime',
    ];

    public function schoolInfo()
    {
        return $this->belongsTo(SchoolInfo::class, 'school_info_id');
    }

    /**
     * Automatically hash passwords when they're set.
     */
    public function setPasswordAttribute($value)
    {
        if (empty($value)) {
            $this->attributes['password'] = null;
            return;
        }

        $this->attributes['password'] = Hash::needsRehash($value) ? Hash::make($value) : $value;
    }

    /**
     * Generate and persist an OTP for this school user.
     *
     * @param int $length
     * @param int $minutes
     * @return string
     */
    public function generateOtp(int $length = 6, int $minutes = 10): string
    {
        $min = (int) pow(10, $length - 1);
        $max = (int) pow(10, $length) - 1;
        $otp = (string) rand($min, $max);

        $this->otp = $otp;
        $this->expired_at = now()->addMinutes($minutes);
        $this->save();

        return $otp;
    }

    /**
     * Validate a provided OTP against the stored one and expiry.
     */
    public function isOtpValid(string $otp): bool
    {
        if (empty($this->otp)) {
            return false;
        }

        if ($this->expired_at && $this->expired_at->isPast()) {
            return false;
        }

        return hash_equals((string) $this->otp, (string) $otp);
    }

    /**
     * Invalidate current OTP.
     */
    public function invalidateOtp(): void
    {
        $this->otp = null;
        $this->expired_at = null;
        $this->save();
    }
}