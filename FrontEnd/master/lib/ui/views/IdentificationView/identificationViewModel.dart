import 'dart:async';
import 'dart:io';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/telaSharedPrefs.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IdentificationViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final TelaSharedPrefs _sharedPrefs = locator<TelaSharedPrefs>();
  String nom = 'SEREME';
  String prenom = 'Habib Seydou Laty';
  String phone = '+225 07 00 00 00 00';
  String phone2 = '+225 07 00 00 00 00';
  String birthPlace = '';
  DateTime birthDay = DateTime(DateTime.now().year - 15);
  String pays = '';
  String nationnalite = '';
  String villeResidence = '';
  String docNumber = '';
  File? docRecto;
  File? docVerso;
  bool isMan = false;
  bool isAccepted = false;

  IdentificationViewModel() {
    phone = _sharedPrefs.getPhoneNumber() ?? '';
    nom = _sharedPrefs.getName() ?? '';
    prenom = _sharedPrefs.getFirstName() ?? '';
  }

  Future identify() async {
    await _authService.identification(
      nom: nom,
      prenom: prenom,
      telephone: phone,
      phone2: phone2,
      id: _authService.user!.id,
      genre: isMan ? 'Homme' : 'Femme',
      birthDate: birthDay.toIso8601String(),
      birthPlace: birthPlace,
      nation: nationnalite,
      pays: pays,
      villeResi: villeResidence,
      documentNumber: docNumber,
      docRecto: docRecto!.path ?? '',
      docVerso: docVerso!.path ?? '',
    );
    _sharedPrefs.savePhoneNumber(phone);
    _navigationService.navigateToProfile();
  }

  // Future pickPhoto() async{
  //   File? pic = await _navigationService.navigateToCameraView();
  //   photo = pic;
  //   notifyListeners();
  // }

  void navigateToCGU() async {
    await _navigationService.navigateTo(Routes.conditionGeneralDUtilisationS);
  }

  Future pickRecto() async {
    File? pic = await _navigationService.navigateToCameraView();
    docRecto = pic;
    notifyListeners();
  }

  Future pickVerso() async {
    File? pic = await _navigationService.navigateToCameraView();
    docVerso = pic;
    notifyListeners();
  }
}
