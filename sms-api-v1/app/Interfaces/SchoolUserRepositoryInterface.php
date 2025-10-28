<?php
namespace App\Interfaces;

interface SchoolUserRepositoryInterface{
    public function verifyOtp(array $data);
    public function setNewPassword(array $data);
}