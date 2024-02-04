import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/telaSharedPrefs.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../models/abonnementType.dart';
import '../../../../models/daily_question.dart';
import '../../../../models/transactions.dart';
import '../../../../services/transaction_service.dart';

class QuestionViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final TransactionService _transactionService = locator<TransactionService>();

  User? get user => _authService.user;
  DailyQuestion?  get dailyquestion  => _authService.dailyquestion;

  String response_1 = "";
  String response_2 = "";
  int isStaff = User.isStaff;
  int id = 0;

  QuestionViewModel();

  Future saveResponse() async {
    await _authService.saveResponse(
        question_id: dailyquestion!.id,
        response_1: response_1,
        response_2: response_2
    );
  }

  Future<void> getQuestion()async{
    await _authService.getAllQuestions();
  }

  Future<String> getTransactioNumber() async {
    return await _transactionService.getTransactionNumber('Abonnement');
  }

  Future pushTransaction(
      TelaTransaction transaction, AbonnementType abonnement) async {
    await _transactionService
        .buyAbonnement(
        transaction: transaction,
        abonnement: abonnement,
        userId: _authService.user!.id)
        .then((value) {
      _authService.abonnement = value;
    });
  }
}