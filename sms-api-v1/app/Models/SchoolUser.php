<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchoolUser extends Model
{
    /** @use HasFactory<\Database\Factories\SchoolUserFactory> */
    use HasFactory;

    protected $fillable = [
        'school_info_id',
        'email',
        'otp',
        'expired_at',
        'password'
    ];
    protected $hidden = ['otp', 'password'];
    public function schoolInfo()
    {
        return $this->belongsTo(SchoolInfo::class, 'school_info_id');
    }
}
