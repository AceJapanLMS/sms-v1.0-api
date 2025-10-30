<?php

namespace App\Http\Controllers;

use App\Http\Resources\RoleResource;
use App\Models\Role;
use App\Responses\ApiResponse;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    /**
     * Get all roles
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        try {
            $roles = Role::all();
            return ApiResponse::sendResponse(RoleResource::collection($roles), 'Roles retrieved successfully');
        } catch (\Exception $e) {
            return ApiResponse::sendResponseFailed([], 'Failed to retrieve roles');
        }
    }
}
