import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/place_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VisiteViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PlaceService _placeService = locator<PlaceService>();
  AuthService authService = locator<AuthService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  VisiteViewModel() {
    print('+***********USER PHOTO');
    print(authService.user!.photo);
  }

  void navigateToProfile() async {
    await _navigationService.navigateTo(Routes.acceuil);
  }

  void navigateToModifPlace(TelaPlace place) async {
    await _navigationService.navigateToModifPlace(place: place);
  }

  void navigateToImageNav(List<String> images, int index) async {
    await _navigationService.navigateToImageNav(
        images: images, startIndex: index);
  }

  void deletePlace(TelaPlace place) async {
    await _placeService
        .deletePlace(place: place)
        .whenComplete(() => _navigationService.popRepeated(1));
  }
}
