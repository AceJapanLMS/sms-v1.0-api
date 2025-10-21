<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Interfaces\CityRepositoryInterface;
use App\Repositories\CityRepository;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->bind(CityRepositoryInterface::class, CityRepository::class);
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}
