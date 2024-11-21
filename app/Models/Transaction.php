<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;

        protected $guarded =[];

    public function user()

    {

        return $this->belongsTo(User::class);

    }


    public function airtime_purchase()

    {

        return $this->hasOne(AirtimePurchase::class);

    }


    public function electricity_payment()

    {

        return $this->hasOne(ElectricityPayment::class);

    }


    public function data_purchase()

    {

        return $this->hasOne(DataPurchase::class);

    }
}
