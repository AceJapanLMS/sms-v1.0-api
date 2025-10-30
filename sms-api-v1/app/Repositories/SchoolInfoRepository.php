<?php
namespace App\Repositories;

use App\Interfaces\SchoolInfoRepositoryInterface;
use App\Models\SchoolInfo;
use App\Services\EmailVerificationService;
use Illuminate\Support\Facades\Log;

class SchoolInfoRepository implements SchoolInfoRepositoryInterface {
    protected $emailVerificationService;

    public function __construct(EmailVerificationService $emailVerificationService) {
        $this->emailVerificationService = $emailVerificationService;
    }

    public function getAll() {
        return SchoolInfo::all();
    }
    public function getById($id){
        return SchoolInfo::findOrFail($id);
    }
    public function create(array $data){
        try {
            // Verify email validity
            if (!$this->emailVerificationService->isValidEmail($data['contact_email'])) {
                return ['error' => 'Invalid email domain. Please use a valid email address.'];
            }
            // Check for disposable email
            if ($this->emailVerificationService->isDisposableEmail($data['contact_email'])) {
                return ['error' => 'Disposable email addresses are not allowed.'];
            }
            // Check for existing school name or email
            // $schoolInfo = SchoolInfo::where('school_name',$data['school_name'])
            //     ->orWhere('contact_email',$data['contact_email'])
            //     ->first();

             // Check for existing only email field
            $schoolInfo = SchoolInfo::where('contact_email',$data['contact_email'])->first();

            if($schoolInfo){
                //already exist
                return ['error' => 'School name or email already exists.'];
            }
            $newSchoolInfo = SchoolInfo::create($data);
            return $newSchoolInfo;
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

    public function getByEmail($email)
    {
        return SchoolInfo::where('contact_email', $email)->first();
    }
}
