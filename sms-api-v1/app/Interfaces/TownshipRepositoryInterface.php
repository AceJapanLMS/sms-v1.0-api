<?php

namespace App\Interfaces;

interface TownshipRepositoryInterface
{
    public function getAll();
    public function getById($id);
}
