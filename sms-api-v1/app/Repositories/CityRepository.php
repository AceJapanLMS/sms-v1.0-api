<?php

namespace App\Repositories;

use App\Models\City ;
use App\Interfaces\CityRepositoryInterface;
class CityRepository implements CityRepositoryInterface
{
    /**
     * Create a new class instance.
     */
    public function __construct()
    {
        //
    }
    public function getAll(){
        //go to model
        return City::all();
    }

    public function getById($id){
       return City::findOrFail($id);
    }

    public function create(array $data){
        return City::create($data);
    }

    public function update($id, array $data){
        $city = City::findOrFail($id);
        $city->update($data);
        return $city;
    }

    public function delete($id){
        $city = City::findOrFail($id);
        return $city->delete();
    }
}
