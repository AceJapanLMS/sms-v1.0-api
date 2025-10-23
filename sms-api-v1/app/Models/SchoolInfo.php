<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchoolInfo extends Model
{
    /** @use HasFactory<\Database\Factories\SchoolInfoFactory> */
    use HasFactory;
    //protected $table = 'school_info';
    protected $fillable = [
        'school_name',
        'school_level',
        'contact_email',
        'contact_phone_no',
        'city_id',
        'township_id',
        'address_detail',
    ];
    public $timestamps = true;
}