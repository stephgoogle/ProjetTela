import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CameraViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthService _authService = locator<AuthService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  Future<List<TelaPlace>> get getMyPlaces => _authService.getMyPlaces();

  CameraViewModel();

  void navigateToProfile() async {
    await _navigationService.navigateToProfile();
  }

  void navigateToMyVisite(TelaPlace place) async {
    await _navigationService.navigateToMyVisite(place: place);
  }

  void navigateToCapture(File image) async {
    var result = await _navigationService.navigateToCaptureView(image: image);
    if (result) {
      _navigationService.back<File>(result: image);
    }
  }

  void navigateBack(bool valide) async {
    _navigationService.back<bool>(result: valide);
  }

  fileHolder(File image) async {
    _authService.setImagetemp(image);
  }

  Future pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      navigateToCapture(File(result.files.single.path!));
    }
  }
}
