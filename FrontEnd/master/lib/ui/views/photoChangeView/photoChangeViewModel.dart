import 'dart:async';
import 'dart:io';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/telaSharedPrefs.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PhotoChangeViewModel extends BaseViewModel {
  final AuthService authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final TelaSharedPrefs _sharedPrefs = locator<TelaSharedPrefs>();
  String passwordn = '';
  String password = '';

  File? photo;

  PhotoChangeViewModel();

  Future pickPhoto() async {
    File? pic = await _navigationService.navigateToCameraView();
    photo = pic;
    notifyListeners();
  }

  Future changePhoto() async {
    User? u = await authService.changePhoto(
        photo: photo?.path ?? '', phone: authService.user!.phone);
    _navigationService.navigateToProfile();
    return u;
  }
}
