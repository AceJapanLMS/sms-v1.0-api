<?php

namespace App\Interfaces;

interface SendOtpEmailRepositoryInterface
{
    public function saveSchoolUser(array $data);
    public function updateSchoolUser(array $data);
}
