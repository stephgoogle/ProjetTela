<?php

namespace App\Http\Controllers;

use App\Models\Responses;
use Illuminate\Http\Request;

class ResponseController extends Controller
{
    //On enregistre la reponse de l'utilisateur

    public function saveUserResponse(Request $request)
    {
        $response = new Responses();

        $response->user_id = $request->user_id;
        $response->question_id = $request->question_id;
        $response->reponse_1 = $request->response_1;
        $response->reponse_2 = $request->response_2;
        $response->created_at = now();
        
        $response->save();
    }
}
