<?php

namespace App\Http\Controllers;

use App\Interfaces\TownshipRepositoryInterface;
use App\Responses\ApiResponse;
use Illuminate\Http\JsonResponse;

use Illuminate\Http\Request;

class TownshipController extends Controller
{
    //declare interface
    protected TownshipRepositoryInterface $townships;

    //create obj and save repositoryInterface
    public function __construct(TownshipRepositoryInterface $townships)
    {
        $this->townships = $townships;
    }
    //api/township
    public function index(): JsonResponse
    {
        $data = $this->townships->getAll();
        return ApiResponse::sendResponse($data, '', 200);
    }

    //api/township/{id}
    public function show(string $id): JsonResponse
    {
        $data = $this->townships->getById($id);
        return ApiResponse::sendResponse($data, '', 200);
    }

    // api/township/city_id/{city_id}
    public function getByCity($city_id): JsonResponse
    {
    // Call repository method to get filtered data
        $data = $this->townships->getByCity($city_id);
        return ApiResponse::sendResponse($data, '', 200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): JsonResponse
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): JsonResponse
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id): JsonResponse
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): JsonResponse
    {
        //
    }
}
