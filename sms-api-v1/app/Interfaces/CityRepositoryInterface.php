<?php

namespace App\Interfaces;

interface CityRepositoryInterface
{
    public function getAll();
    public function getById($id);
}
