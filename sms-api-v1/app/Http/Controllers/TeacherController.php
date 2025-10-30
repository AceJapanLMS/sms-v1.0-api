<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateTeacherRequest;
use App\Models\Teacher;
use App\Models\User;
use App\Responses\ApiResponse;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class TeacherController extends Controller
{
    /**
     * Store a newly created teacher and user.
     *
     * @param CreateTeacherRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(CreateTeacherRequest $request)
    {
        try {
            $user = User::create([
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'nrc' => $request->nrc,
                'birthday' => $request->birthday,
                'phone' => $request->phone,
                'address' => $request->address,
                'teacher_level' => $request->teacher_level,
                'role' => $request->role,
                'education' => $request->education,
                'teacher_fees' => $request->teacher_fees,
                'username' => $request->username,
                'gender' => $request->gender,
                'password' => Hash::make($request->password)
            ]);
            return ApiResponse::sendResponse($user, 'Teacher created successfully');
        } catch (\Exception $e) {
            return ApiResponse::sendResponseFailed([], 'Failed to create teacher');
        }
    }
}
