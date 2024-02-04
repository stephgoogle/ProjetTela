import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/auth_service.dart';

class VainqueurViewModel extends BaseViewModel{
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<dynamic> get winners => _authService.winner;

}