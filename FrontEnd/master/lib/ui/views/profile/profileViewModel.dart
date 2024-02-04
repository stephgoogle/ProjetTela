import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  AuthService authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  final bool _isA = false;

  Stream<bool> get isAuth => authService.isConnected;
  User? get user => authService.user;
  Abonnement? get abonnement => authService.abonnement;
  String get stra => authService.abonnement != null
      ? authService.abonnement!.startSTR()
      : 'Du ...';
  String get enda => authService.abonnement != null
      ? authService.abonnement!.endSTR()
      : 'Au ...';
  String get strd => authService.passVisite != null
      ? authService.passVisite!.startSTR()
      : 'Du ...';
  String get endd => authService.passVisite != null
      ? authService.passVisite!.endSTR()
      : 'Au ...';
  PassVisite? get passVisite => authService.passVisite;

  ProfileViewModel() {
    print('***************PASS******************');
    print(authService.passVisite);
    notifyListeners();
  }

  void navigateToEbank() async {
    await _navigationService.navigateToBank(
        hasEpargne: authService.bankProfile?.hasEpargne ?? false);
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
    await _navigationService.navigateToCatalogue();
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

  void navigateToVisitePass() async {
    await _navigationService.navigateToBuyVisitePass(isVisite: true);
  }

  void navigateToAbonnement() async {
    await _navigationService.navigateToBuyAbonnement();
  }

  void navigateToIdentification() async {
    await _navigationService.navigateToIdentificationView();
  }

  void navigateToMaisonVisite() async {
    await _navigationService.navigateToMaisonVisite();
  }

  void navigateToProlongeVisitePass() async {
    await _navigationService.navigateToBuyVisitePass(
        isVisite: true, isRenew: true);
  }

  void navigateTochangePhoto() async {
    await _navigationService.navigateToPhotoChangeView(fromBank: false);
  }

  changeMDP() {
    _navigationService.navigateToPasswordChangeView(fromBank: false);
  }

  void chechPass(String code) async {
    PassVisite? p = await authService.verifCodeVisite(code: code);
    if (p != null) {
      print(passVisite);
      navigateToProfile();
      print('passVisite **********++++++++');
      print(p);
      notifyListeners();
    }
  }

  deconnection() {
    authService.logout();
    navigateToAcceuil();
  }
}
