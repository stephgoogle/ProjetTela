<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    //Recupère le ou les utilisateurs gagnant du quiz
    public function getAllWinner()
    {
        $winner = DB::table('users')
                        ->join('responses', 'users.id', '=', 'responses.user_id')
                        ->join('questions', 'questions.id', '=', 'responses.question_id')
                        ->orwhereColumn(
                            [
                                ['questions.reponse_1', '=', 'responses.reponse_1'],
                                ['questions.reponse_2', '=', 'responses.reponse_2']
                            ]
                        )->get();
        
        return response()->json($winner);
    }

    //On supprime les anciennes questions et reponses
    public function deleteOldestQuestionAndResponse()
    {
        DB::table('responses')->delete();
        DB::table('questions')->delete();
    }
}
