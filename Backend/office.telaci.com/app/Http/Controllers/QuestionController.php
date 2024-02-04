<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use App\Models\Questions;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    //On recupère toutes les questions
    public function getAllQuestions()
    {
        $questions = DB::table('questions')->latest()->get();
        
        return response()->json($questions);
    }


    //On enregistre les questions quotidiennes

    public function saveDailyQuestion(Request $request)
    {
        $question = new Questions();
        
        $question->question_1 = $request->question_1;
        $question->question_2 = $request->question_2;
        $question->reponse_1 = $request->response_1;
        $question->reponse_2 = $request->response_2;
        $question->created_at = now();
        
        $question->save();
    }
}
