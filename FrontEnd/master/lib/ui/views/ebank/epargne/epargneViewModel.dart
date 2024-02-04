import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EpargneViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  AuthService authService = locator<AuthService>();

  EpargneViewModel();

  void navigateToProfile() async {
    await _navigationService.navigateTo(Routes.acceuil);
  }

  void retrait() async {
    await _navigationService.navigateToRetrait(fromEpargne: true);
  }

  void depot() async {
    await _navigationService.navigateToDepot();
  }

  void renewAbonnement() async {
    await _navigationService.navigateToBuyAbonnementEbank(fromEpargne: true);
  }

  void epargnerReverse() async {
    await _navigationService.navigateToVersement();
  }

  verserSurCompte() {
    _navigationService.navigateToVersementRet();
  }
}
