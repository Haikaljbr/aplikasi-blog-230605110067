<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    protected $table = 'admin';
    public $timestamps = false;

    protected $fillable = [
        'username',
        'password',
    ];

    protected $hidden = [
        'password',
    ];

    /**
     * Kolom login untuk guard admin adalah 'username'
     */
    public function getAuthIdentifierName(): string
    {
        return 'username';
    }
}
