<?php
namespace App\Repositories;

use App\Interfaces\SchoolInfoRepositoryInterface;
use App\Models\SchoolInfo;
use Illuminate\Support\Facades\Log;

class SchoolInfoRepository implements SchoolInfoRepositoryInterface{
    public function getAll(){
        return SchoolInfo::all();
    }
    public function getById($id){
        return SchoolInfo::findOrFail($id);
    }
    public function create(array $data){
        try {
            $schoolInfo = SchoolInfo::where('school_name',$data['school_name'])
            ->orwhere('contact_email',$data['contact_email'])
            ->first();

            Log::info('SchoolInfo query result:', ['data' => $schoolInfo]);

        if($schoolInfo){
            //already exist
            return false;
        }
        else{
            $newSchoolInfo = SchoolInfo::create($data);
            return $newSchoolInfo;
        }
        } catch (Throwable $e) {
            report($e);
            return false;
        }
    }
    public function update($id, array $data){
        $schoolInfo = SchoolInfo::findOrFail($id);
        $schoolInfo-> update($data);
        return $schoolInfo;
    }
    public function delete($id){
        SchoolInfo::destory($id);
    }
}