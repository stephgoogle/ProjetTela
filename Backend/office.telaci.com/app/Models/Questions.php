<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Questions extends Model
{
    use HasFactory;

    public function response(): HasOne
    {
        return $this->hasOne(Responses::class);
    }
}
