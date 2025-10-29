<?php
namespace App\Interfaces;

interface SchoolUserRepositoryInterface{
    public function verifyOtp(array $data);
    public function setNewPassword(array $data);
    public function sign(array $data);
}