<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Interfaces\CityRepositoryInterface;
use App\Repositories\CityRepository;
use App\Interfaces\TownshipRepositoryInterface;
use App\Repositories\TownshipRepository;
use App\Interfaces\SchoolInfoRepositoryInterface;
use App\Repositories\SchoolInfoRepository;
use App\Interfaces\SchoolUserRepositoryInterface;
use App\Repositories\SchoolUserRepository;
use App\Interfaces\SendOtpEmailRepositoryInterface;
use App\Repositories\SendOtpEmailRepository;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->bind(CityRepositoryInterface::class, CityRepository::class);
        $this->app->bind(TownshipRepositoryInterface::class,TownshipRepository::class);
        $this->app->bind(SchoolInfoRepositoryInterface::class,SchoolInfoRepository::class);
        $this->app->bind(SchoolUserRepositoryInterface::class,SchoolUserRepository::class);
        $this->app->bind(SendOtpEmailRepositoryInterface::class,SendOtpEmailRepository::class);
    }
    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}
