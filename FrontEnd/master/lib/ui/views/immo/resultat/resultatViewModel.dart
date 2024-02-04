import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResultatViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  PassVisite? get passVisite => _authService.passVisite;
  ResultatViewModel();

  void navigateToVisite(TelaPlace place) async {
    print(passVisite.toString());
    if (passVisite != null) {
      bool isExp = false;
      isExp = passVisite!.isExpired;
      PassVisite? pv = await _authService.moin1Visite(
          code: passVisite!.code, placeID: place.id);

      if (!isExp) {
        await _navigationService.navigateToVisite(place: place);
      }
    }
  }

  void navigateToVisiteAbonnement(bool isVisite) async {
    await _navigationService.navigateToBuyVisitePass(isVisite: isVisite);
  }
}
