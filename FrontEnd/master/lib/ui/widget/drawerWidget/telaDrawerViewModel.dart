import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:mobile/ui/views/tv/question_quotidien/questionViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TelaDrawerViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthService authService = locator<AuthService>();

  List<dynamic> winners = [];

  // late VideoPlayerController videoController;

  TelaDrawerViewModel();

  void navigateToAcceuil() async {
    await _navigationService.navigateTo(Routes.acceuil);
  }

  void navigateToProfile() async {
    await _navigationService.navigateTo(Routes.profile);
  }

  void navigateToTV() async {
    await _navigationService.navigateTo(Routes.chanelTv);
  }

  void navigateToRechercheBureau() async {
    await _navigationService.navigateToRecherche(isBureau: true);
  }

  void navigateToRechercheLogement() async {
    await _navigationService.navigateToRecherche(isBureau: false);
  }

  void navigateToEbank() async {
    await _navigationService.navigateToBank(
        hasEpargne: authService.bankProfile?.hasEpargne ?? false);
  }

  void navigateToPubTV() async {
    await _navigationService.navigateToTvPub();
  }

  void navigateToLiveTV() async {
    await _navigationService.navigateToTvLive();
  }

  void navigateToLiveTVSport() async {
    await _navigationService.navigateToTvSport();
  }

  void navigateToLiveTVExclu() async {
    await _navigationService.navigateToTvExclu();
  }

  void navigateToLiveTVDiffere() async {
    await _navigationService.navigateToBientot();
  }

  void navigateToLiveTVFilms() async {
    await _navigationService.navigateToTvFilm();
  }

  void navigateToDailyQuestion() async {
  await _navigationService.navigateToDailyQuestion();
  }

  void navigateToAddQuestion() async {
    await _navigationService.navigateToAddDailyQuestion();
  }

  Future<void> getQuestion()async{
    await authService.getAllQuestions();
  }

  Future<void> getAllWinner()async{
    await authService.getAllWinner();
  }

  void navigateToWinner() async {
    await _navigationService.navigateToWinner();
  }

}
