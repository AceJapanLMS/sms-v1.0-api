<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreSchoolInfoRequest;
use App\Interfaces\SchoolInfoRepositoryInterface;
use App\Responses\ApiResponse;
use Illuminate\Http\JsonResponse;

class SchoolInfoController extends Controller
{
    protected SchoolInfoRepositoryInterface $schoolinfos;

    public function __construct(SchoolInfoRepositoryInterface $schoolinfos){
        $this->schoolinfos = $schoolinfos;
    }
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        $data = $this->schoolinfos->getAll();
        return ApiResponse::sendResponse($data,'',200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreSchoolInfoRequest $request): JsonResponse
    {
        $schoolinfo = $this->schoolinfos->create($request->validated());
        //dd($schoolinfo);
        if($schoolinfo){
            return ApiResponse::sendResponse($schoolinfo,'School Info created',201);
        }
        else{
            return ApiResponse::sendResponseFailed(null,'Already existed');
        }
    }
    /**
     * Display the specified resource.
     */
    public function show($id): JsonResponse
    {
        $data = $this->schoolinfos->getById($id);
        return ApiResponse::sendResponse($data,'',200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(StoreSchoolInfoRequest $request, string $id)
    {
        $schoolinfo = $this->schoolinfos->update($request->validated());
        return ApiResponse::sendResponse($schoolinfo,'School Info updated',200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id): Response
    {
        $this->schoolinfos->delete($id);
        return ApiResponse::sendResponse(null,'School info deleted',204);
    }
}
