<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    protected $table = 'penulis';
    public $timestamps = false;

    protected $fillable = [
        'nama_depan',
        'nama_belakang',
        'user_name',
        'password',
        'foto',
    ];

    protected $hidden = [
        'password',
    ];

    /**
     * Override kolom username untuk Auth::attempt()
     * karena kolom login kita adalah 'user_name', bukan 'email'
     */
    public function getAuthIdentifierName(): string
    {
        return 'user_name';
    }
}
