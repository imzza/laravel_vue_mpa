<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class StudentResource extends JsonResource {
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request) {
        // return parent::toArray($request);

        return [
            'id' => $this->id,
            'about' => $this->about,
            'address' => $this->address,
            'address2' => $this->address2,
            'city' => $this->city,
            'email' => $this->email,
            'first_name' => $this->first_name,
            'gender' => $this->gender,
            'image' => url('public/images/' . $this->image),
            'last_name' => $this->last_name,
            'password' => $this->password,
            'state' => $this->state,
            'zip' => $this->zip,
            'offers' => $this->offers
        ];
    }
}
