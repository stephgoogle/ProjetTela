import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/commune.dart';
import 'package:mobile/models/place.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/place_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RechercheViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  AuthService authService = locator<AuthService>();
  final PlaceService _placeService = locator<PlaceService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  bool havePass = false;

  bool isBureau = false;
  Commune? commune;

  Stream<bool> get isAuth => authService.isConnected;
  bool isMaisonBasse = false;
  bool isAppart = true;
  bool isDuplex = false;
  bool isResidence = false;
  bool isStudio = false;
  bool isChambre = false;
  bool isHautStanding = false;
  bool hasPiscine = false;
  bool hasGardien = false;
  bool hasGarage = false;
  bool hasCoursAvant = false;
  bool hasCoursArriere = false;
  bool hasBalconAvant = false;
  bool hasBalconArriere = false;

  int nombreDePieces = 1;
  int nombreDeSalleDeau = 1;

  List<Commune> communes = [];
  List<DropdownMenuItem<Commune>> dropDownItems = [];
  PassVisite? get passVisite => authService.passVisite;

  Future<List<DropdownMenuItem<Commune>>> cc() async {
    if (communes.isEmpty) {
      communes = authService.communes;
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

  RechercheViewModel() {
    communes = authService.communes;
    PassVisite? passVisite = authService.passVisite;
    if (passVisite != null) {
      havePass = true;
    }
  }

  Future search() async {
    List<TelaPlace> plac = await _placeService.searchLogement(
      communeId: commune!.id,
      nombrePiece: nombreDePieces,
      nombreSalleEau: nombreDeSalleDeau,
      minPrice: null,
      maxPrice: null,
      isBureau: isBureau,
      isStudio: isStudio,
      isMaisonBasse: isMaisonBasse,
      isHautStanding: isHautStanding,
      isChambre: isChambre,
      isHautStandingPiscine: isHautStanding,
      isResidence: isResidence,
      isDuplex: isDuplex,
      isAppartment: isAppart,
      hasPiscine: hasPiscine,
      hasGardien: hasGardien,
      hasGarage: hasGarage,
      hasCoursAvant: hasCoursAvant,
      hasCoursArriere: hasCoursArriere,
      hasBalconArriere: hasBalconArriere,
      hasBalconAvant: hasBalconAvant,
    );
    List<TelaPlace> pp = [];
    for (var pl in plac) {
      pl.commune =
          communes.where((element) => element.id == pl.communeId).first;
      pp.add(pl);
    }

    navigateToResult(pp);
  }

  void navigateToResult(List<TelaPlace> places) async {
    await _navigationService.navigateToResultat(places: places);
  }

  void navigateToVisiteAbonnement(bool isVisite) async {
    await _navigationService.navigateToBuyVisitePass(isVisite: isVisite);
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
    await _navigationService.navigateTo(Routes.catalogue);
  }

  void navigateToAcceuil() async {
    await _navigationService.navigateTo(Routes.acceuil);
  }

  Future chechPass(String code) async {
    await authService.verifCodeVisite(code: code);
  }
}
