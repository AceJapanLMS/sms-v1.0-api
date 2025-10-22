<?php

namespace App\Repositories;

use App\Models\Township ;
use App\Interfaces\TownshipRepositoryInterface;

//implement the township interface
class TownshipRepository implements TownshipRepositoryInterface
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
        return Township::all();
    }

    public function getById($id){
       return Township::findOrFail($id);
    }

    public function create(array $data){
        return Township::create($data);
    }

    public function update($id, array $data){
        $township = Township::findOrFail($id);
        $township->update($data);
        return $township;
    }

    public function delete($id){
        $township = Township::findOrFail($id);
        return $township->delete();
    }
}
