<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCityRequest;
use App\Http\Requests\UpdateCityRequest;
use App\Interfaces\CityRepositoryInterface;
use App\Responses\ApiResponse;
use Illuminate\Http\JsonResponse;

class CityController extends Controller
{
    protected CityRepositoryInterface $cities;

    public function __construct(CityRepositoryInterface $cities)
    {
        $this->cities = $cities;
    }
    //api/city
    public function index(): JsonResponse
    {
        $data = $this->cities->getAll();
        return ApiResponse::sendResponse($data, '', 200);
    }

    public function show($id): JsonResponse
    {
        $data = $this->cities->getById($id);
        return ApiResponse::sendResponse($data, '', 200);
    }

    public function store(StoreCityRequest $request): JsonResponse
    {
        $city = $this->cities->create($request->validated());
        return ApiResponse::sendResponse($city, 'City created', 201);
    }

    public function update(UpdateCityRequest $request, $id): JsonResponse
    {
        $city = $this->cities->update($id, $request->validated());
        return ApiResponse::sendResponse($city, 'City updated', 200);
    }

    public function destroy($id): JsonResponse
    {
        $this->cities->delete($id);
        return ApiResponse::sendResponse(null, 'City deleted', 204);
    }
}

