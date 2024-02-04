import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyAbonnementViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  final bool _isA = false;
  List<AbonnementType> abonnements = [];

  Stream<bool> get isAuth => _authService.isConnected;
  User? get user => _authService.user;

  BuyAbonnementViewModel() {
    abonnements = _authService.abonnementType;
  }

  void navigateToEbank() async {
    await _navigationService.navigateTo(Routes.bank);
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

  void navigateToGalery() async {
    await _navigationService.navigateTo(Routes.catalogue);
  }

  void navigateToAcceuil() async {
    await _navigationService.navigateTo(Routes.acceuil);
  }

  void navigateToSignIn() async {
    await _navigationService.navigateTo(Routes.signInView);
  }

  void navigateToLogIn() async {
    await _navigationService.navigateTo(Routes.loginView);
  }

  void navigateToBuyView(AbonnementType abonnement) async {
    await _navigationService.navigateToBuyView(abonement: abonnement);
  }

  void navigateToCGUFinance() async {
    await _navigationService.navigateTo(Routes.conditionGeneralDUtilisationS);
  }
}
