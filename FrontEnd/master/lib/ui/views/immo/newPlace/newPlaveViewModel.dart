import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/commune.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/place_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewPlaceViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final PlaceService _placeService = locator<PlaceService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  bool havePass = false;

  bool isBureau = false;
  late Commune commune;

  String nomProprio = '';
  String phone = '';
  String prix = '0';
  String description = '';

  Stream<bool> get isAuth => _authService.isConnected;
  bool isMaisonBasse = false;
  bool isAppart = false;
  bool isDuplex = false;
  bool isStudio = false;
  bool isResidence = false;
  bool isChambre = false;
  bool isHautStanding = false;
  bool isHautStandingPicine = false;
  bool hasPiscine = false;
  bool hasGardien = false;
  bool hasGarage = false;
  bool hasCoursAvant = false;
  bool hasCoursArriere = false;
  bool hasBalconAvant = false;
  bool hasBalconArriere = false;
  bool isOccupe = false;

  int nombreDePieces = 1;
  int nombreDeSalleDeau = 1;

  List<Commune> communes = [];
  List<DropdownMenuItem<Commune>> dropDownItems = [];

  List<File?> images = [];
  File? img;
  Future<List<DropdownMenuItem<Commune>>> cc() async {
    if (communes.isEmpty) {
      communes = _authService.communes;
      commune = communes.first;
      for (Commune element in communes) {
        dropDownItems.add(DropdownMenuItem(
          value: element,
          child: Text(
            element.name,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1),
          ),
        ));
      }
    }

    return dropDownItems;
  }

  NewPlaceViewModel() {
    communes = _authService.communes;
    commune = communes.first;
    for (int i = 0; i < 10; i++) {
      images.add(null);
    }
  }

  Future addPlace() async {
    TelaPlace place = TelaPlace(
      id: 0,
      proprioName: nomProprio,
      proprioTelephone: phone,
      description: description,
      latitude: 0,
      longitude: 0,
      price: double.parse(prix),
      communeId: commune.id,
      nombrePiece: nombreDePieces,
      nombreSalleEau: nombreDeSalleDeau,
      demarcheurId: _authService.user!.id,
      isOccupe: isOccupe,
      isAppartment: isAppart,
      isDuplex: isDuplex,
      isBureau: isBureau,
      isStudio: isStudio,
      isMaisonBasse: isMaisonBasse,
      isChambre: isChambre,
      isResidence: isResidence,
      isHautStanding: isHautStanding,
      hasPiscine: hasPiscine,
      hasCoursAvant: hasCoursAvant,
      hasCoursArriere: hasCoursArriere,
      hasBalconArriere: hasBalconArriere,
      hasBalconAvant: hasBalconAvant,
      hasGarage: hasGarage,
      hasGardien: hasGardien,
    );
    TelaPlace? telaPlace =
        await _placeService.addPlace(place: place, images: images);
    if (telaPlace != null) {
      _authService.placeAdded(telaPlace);
      _navigationService.navigateToCatalogue();
    }
    // _snackbarService.showSnackbar(message: 'Test', duration: const Duration(seconds: 10));
  }

  void navigateToResult(List<TelaPlace> places) async {
    await _navigationService.navigateToResultat(places: places);
  }

  void navigateToCatalogue() async {
    await _navigationService.navigateToCatalogue();
  }

  void navigateToVisiteAbonnement(bool isVisite) async {
    await _navigationService.navigateToBuyVisitePass(isVisite: isVisite);
  }

  Future navigateToCameraView(int index) async {
    File? pic = await _navigationService.navigateToCameraView();
    images[index] = pic;
    notifyListeners();
  }
}
