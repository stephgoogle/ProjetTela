import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CatalogueViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthService _authService = locator<AuthService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  Future<List<TelaPlace>> get getMyPlaces => _authService.getMyPlaces();

  CatalogueViewModel();

  void navigateToProfile() async {
    await _navigationService.navigateToProfile();
  }

  void navigateToMyVisite(TelaPlace place) async {
    await _navigationService.navigateToMyVisite(place: place);
  }

  void navigateToNewplace() async {
    await _navigationService.navigateToNewPlace();
  }
}
