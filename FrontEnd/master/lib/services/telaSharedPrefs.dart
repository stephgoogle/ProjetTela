import 'package:camera/camera.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/commune.dart';
import 'package:mobile/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';

class TelaSharedPrefs implements InitializableDependency {
  TelaSharedPrefs(); // static final PyraNotification _singleton = PyraNotification._internal();

// Obtain shared preferences.
  late SharedPreferences prefs;

  late final List<CameraDescription> cameras;
  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    cameras = await availableCameras();
  }

  /// save phone number
  Future<void> savePhoneNumber(String phone) async {
    await prefs.setString('phone', phone);
  }

  /// get phone number
  String? getPhoneNumber() {
    return prefs.getString('phone');
  }

  /// save name
  Future<void> saveName(String name) async {
    await prefs.setString('name', name);
  }

  /// get name
  String? getName() {
    return prefs.getString('name');
  }

  /// save first name
  Future<void> saveFirstName(String name) async {
    await prefs.setString('prenom', name);
  }

  /// get name
  String? getFirstName() {
    return prefs.getString('prenom');
  }

  /// save abonnements
  Future<void> saveAbonnements(List<Abonnement> abonnement) async {
// Save an list of strings to 'items' key.

    await prefs.setStringList(
        'abonnements', abonnement.map((e) => e.toString()).toList());
  }

  /// get abonnement
  List<Abonnement> getAbonnements() {
    List<Abonnement> list = [];
    List<String>? items = prefs.getStringList('abonnements');
    for (String element in items!) {
      List<String> sti = element.split(', ');
      Map<String, dynamic> json = {};
      for (String key_item in sti) {
        List<String> keyItems = key_item.split(': ');
        json[keyItems[0]] = keyItems[1];
      }

      Abonnement ab = Abonnement.fromJson(json);
      list.add(ab);
    }
    return list;
  }

  /// save abonnementType
  Future<void> saveAbonnementType(List<AbonnementType> abonnementType) async {
// Save an list of strings to 'items' key.

    await prefs.setStringList(
        'abonnementType', abonnementType.map((e) => e.toString()).toList());
  }

  /// get abonnementType
  List<AbonnementType> getAbonnementType() {
    List<AbonnementType> list = [];
    List<String>? items = prefs.getStringList('abonnementType');
    for (String element in items!) {
      List<String> sti = element.split(', ');
      Map<String, dynamic> json = {};
      for (String itt in sti) {
        List<String> keyItems = itt.split(': ');
        json[keyItems[0]] = keyItems[1];
      }

      AbonnementType at = AbonnementType.fromJson(json);
      list.add(at);
    }
    return list;
  }

  /// save passType
  Future<void> savePassType(List<PassType> passType) async {
    await prefs.setStringList(
        'passType', passType.map((e) => e.toString()).toList());
  }

  /// get passType
  List<PassType> getPassType() {
    List<PassType> list = [];
    List<String>? items = prefs.getStringList('passType');
    for (String element in items!) {
      List<String> sti = element.split(', ');
      Map<String, dynamic> json = {};
      for (String itt in sti) {
        List<String> keyItems = itt.split(': ');
        json[keyItems[0]] = keyItems[1];
      }

      PassType at = PassType.fromJson(json);
      list.add(at);
    }
    return list;
  }

  /// seve communes
  Future<void> saveCommunes(List<Commune> commumes) async {
// Save an list of strings to 'items' key.

    await prefs.setStringList(
        'commumes', commumes.map((e) => e.toString()).toList());
  }

  /// get Communes
  List<Commune> getCommunes() {
    List<Commune> list = [];
    List<String>? items = prefs.getStringList('commumes');
    for (String element in items!) {
      List<String> sti = element.split(', ');
      Map<String, dynamic> json = {};
      for (String key_item in sti) {
        List<String> keyItems = key_item.split(': ');
        json[keyItems[0]] = keyItems[1];
      }

      Commune commune = Commune.fromJson(json);
      list.add(commune);
    }
    return list;
  }

  /// save pass visite
  Future<void> savePassVisite(PassVisite pass) async {
// Save an list of strings to 'items' key.

    await prefs.setString('passVisite', pass.toString());
  }

  /// delete pass visite
  Future<void> deletePassVisite() async {
// Save an list of strings to 'items' key.

    await prefs.setString('passVisite', '');
  }

  /// get Communes
  PassVisite? getPassVisite() {
    PassVisite? pass;
    String? item = prefs.getString('passVisite');
    if (item != null && item.isNotEmpty) {
      List<String> sti = item.split(', ');
      Map<String, dynamic> json = {};
      for (String key_item in sti) {
        List<String> keyItems = key_item.split(': ');
        json[keyItems[0]] = keyItems[1];
      }
      pass = PassVisite.fromString(json);
    }

    return pass;
  }

  /// save abonnement
  Future<void> saveAbonnement(Abonnement abonnement) async {
// Save an list of strings to 'items' key.

    await prefs.setString('abonnement', abonnement.toString());
  }

  /// get abonnement
  Abonnement? getAbonnement() {
    Abonnement? abonnement;
    String? item = prefs.getString('abonnement');
    if (item != null) {
      if (item.isNotEmpty) {
        List<String> sti = item.split(', ');
        Map<String, dynamic> json = {};
        for (String key_item in sti) {
          List<String> keyItems = key_item.split(': ');
          json[keyItems[0]] = keyItems[1];
        }
        abonnement = Abonnement.fromString(json);
      }
    }

    return abonnement;
  }

  /// delete abonnement
  Future<void> deleteAbonnement() async {
// Save an list of strings to 'items' key.

    await prefs.setString('abonnement', '');
  }

  /// save profil
  Future<void> saveIdentity(UserIdentity identity) async {
// Save an list of strings to 'items' key.

    await prefs.setString('identity', identity.toString());
  }

  /// get abonnement
  UserIdentity? getIdentity() {
    UserIdentity? identity;
    String? item = prefs.getString('identity');
    if (item != null) {
      List<String> sti = item.split(', ');
      Map<String, dynamic> json = {};
      for (String key_item in sti) {
        List<String> keyItems = key_item.split(': ');
        json[keyItems[0]] = keyItems[1];
      }
      identity = UserIdentity.fromString(json);
    }

    return identity;
  }
}
