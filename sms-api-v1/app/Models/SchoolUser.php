<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchoolUser extends Model
{
    /** @use HasFactory<\Database\Factories\SchoolUserFactory> */
    use HasFactory;

    protected $fillable = [
        'email',
        'otp',
    ];
}
