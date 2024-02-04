import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/programetv.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProgrammeTvViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final TVService _tvService = locator<TVService>();
  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  List<TelaProgrammeTV> program = [];
  ProgrammeTvViewModel() {
    program = _tvService.progTest();
  }

  void navigateToEbank() async {
    await _navigationService.navigateToBank(
        hasEpargne: _authService.bankProfile?.hasEpargne ?? false);
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

  void navigateToLiveTV(TelaProgrammeTV programmeTV) async {
    await _navigationService.navigateToTv(programmeTV: programmeTV);
  }
}
