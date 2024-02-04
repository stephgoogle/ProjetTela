import 'dart:async';
import 'dart:io';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/bank_profile.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/telaSharedPrefs.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EbankSignInViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final TelaSharedPrefs _sharedPrefs = locator<TelaSharedPrefs>();
  String nom = '';
  String prenom = '';
  String phone = '';
  String birthPlace = '';
  String password = '';
  bool isAccepted = false;
  File? photo;

  EbankSignInViewModel();

  Future<TelaBankProfile?> signIn() async {
    await _authService.signIn(
        nom: nom,
        prenom: prenom,
        telephone: phone,
        password: password,
        mail: birthPlace,
        photo: photo?.path ?? '');
    _sharedPrefs.savePhoneNumber(phone);
    _navigationService.navigateToBank(
        hasEpargne: _authService.bankEpargne != null);
    return _authService.bankProfile;
  }

  Future pickPhoto() async {
    File? pic = await _navigationService.navigateToCameraView();
    photo = pic;
    notifyListeners();
  }

  void navigateToCGU() async {
    await _navigationService.navigateTo(Routes.conditionGeneralDUtilisationS);
  }
}
