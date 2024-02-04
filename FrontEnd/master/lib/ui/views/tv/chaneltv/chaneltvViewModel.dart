import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/programetv.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelTvViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final TVService _tvService = locator<TVService>();
  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  List<TelaProgrammeTV> program = [];
  ChannelTvViewModel() {
    program = _tvService.progTest();
  }

  void navigateToLiveTV() async {
    await _tvService.pause();
    await _navigationService.navigateToTvLive();
  }

  void navigateToLiveTVSport() async {
    await _tvService.pause();
    await _navigationService.navigateToTvSport();
  }

  void navigateToLiveTVExclu() async {
    await _tvService.pause();
    await _navigationService.navigateToTvExclu();
  }

  void navigateToLiveTVDiffere() async {
    await _tvService.pause();
    await _navigationService.navigateToBientot();
  }

  void navigateToLiveTVFilms() async {
    await _tvService.pause();
    await _navigationService.navigateToTvFilm();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tvService.pause();
  }
}
