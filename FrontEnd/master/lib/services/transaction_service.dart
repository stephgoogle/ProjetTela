import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/models/abonnement.dart';
import 'package:mobile/models/abonnementType.dart';
import 'package:mobile/models/bank_profile.dart';
import 'package:mobile/models/transactions.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/telaSharedPrefs.dart';

class TransactionService {
  /// URLS
  static const String _BASE_URL = "http://office.telaci.com/";
  static const String _ABONNEMENT_CREATE_URL = "api/abonnements/buy_abonement";
  static const String _PASS_CREATE_URL = "api/pass-visite/buy_pass_visite";
  static const String _PASS_VISITE_PROLONGE_URL =
      "api/pass-visite/prolonge_pass_visite";
  static const String _TRANSACTION_CREATE_URL = "api/transactions/create";
  // static const String _TRANSACTION_CREATE_URL = "api/transactions/create";
  static const String _TRANSACTION_URL = "api/transactions/";
  static const String _BANK_BUY_ABONNEMENT_URL =
      "api/ebanking-profil/buy_abonement_ebank";
  static const String _BANK_DEPOT_URL = "api/ebanking-profil/depot";
  static const String _BANK_RETRAIT_URL = "api/ebanking-profil/retrait";
  static const String _BANK_EPARGNE_URL = "api/ebanking-profil/epargner";
  static const String _BANK_EPARGNE_INVERSE_URL =
      "api/ebanking-profil/epargne_inverse";
  static const String _BANK_TRANSACTIONS_URL =
      "api/ebanking-profil/ebank_transactions";
  static const String _BANK_EPARGNE_TRANSACTIONS_URL =
      "api/ebanking-profil/epargne_transactions";

  bool _certificateCheck(X509Certificate cert, String host, int port) => true;
  Abonnement? _abonnement;
  Abonnement? _abonnementTV;
  Abonnement? _abonnementPro;
  String _token = '';
  final bool _isConnected = false;

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  Abonnement? get abonnementDemarcheur => _abonnementPro;
  Abonnement? get abonnementTV => _abonnementTV;
  Abonnement? get abonnement => _abonnement;
  final TelaSharedPrefs _telaSharedPrefs = locator<TelaSharedPrefs>();

  TransactionService();

  /// CREATE A NEW HTTP CLIENT FOR CALLS
  http.Client _newClient() {
    var ioClient = HttpClient()..badCertificateCallback = _certificateCheck;

    return IOClient(ioClient);
  }

  /// pushTransaction
  Future<TelaTransaction?> postTransaction(
      {required TelaTransaction transaction}) async {
    var client = _newClient();
    try {
      print(
          '${Uri.parse(_BASE_URL + _TRANSACTION_CREATE_URL)} push transaction : $transaction');
      http.Response response = await client.post(
        Uri.parse(_BASE_URL + _TRANSACTION_CREATE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(transaction.toJson()),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        TelaTransaction transac = TelaTransaction.fromJson(json);
        print(transac.toString());
      } else {
        print('ERROR reponse status code not 200');
      }
    } catch (e) {
      print('auth api service login error** $e');
    } finally {
      client.close();
    }
    return transaction;
  }

  /// push retrait
  Future<TelaTransaction?> postRetrait(
      {required amount,
      required frais,
      required TelaBankProfile profile,
      required bool fromEpargne}) async {
    var client = _newClient();
    late TelaTransaction transaction;
    try {
      print('${Uri.parse(_BASE_URL + _BANK_RETRAIT_URL)} push retrait');
      http.Response response = await client.post(
        Uri.parse(_BASE_URL + _BANK_RETRAIT_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'phone': profile.phone,
          'amount': amount,
          'frais': frais,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        TelaTransaction transac = TelaTransaction.fromJson(json['transaction']);
        transaction = transac;
        print(transac.toString());
      } else {
        print('ERROR reponse status code not 200');
      }
    } catch (e) {
      print('auth api service login error** $e');
    } finally {
      client.close();
    }
    return transaction;
  }

  /// push depot
  Future<TelaTransaction?> postDepot(
      {required TelaTransaction transaction,
      required TelaBankProfile profile}) async {
    var client = _newClient();
    Map<String, dynamic> js = profile.toJson();
    Map<String, dynamic> t = transaction.toJson();
    t.remove('id');
    js.addAll(t);

    try {
      print(
          '${Uri.parse(_BASE_URL + _BANK_DEPOT_URL)} push Dépot : $transaction');
      http.Response response = await client.post(
        Uri.parse(_BASE_URL + _BANK_DEPOT_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(js),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        TelaTransaction transac = TelaTransaction.fromJson(json);
        print(transac.toString());
      } else {
        print('ERROR reponse status code not 200');
      }
    } catch (e) {
      print('auth api service login error** $e');
    } finally {
      client.close();
    }
    return transaction;
  }

  /// push epargne
  Future<TelaTransaction?> postVersementToEpargne(
      {required amount, required TelaBankProfile profile}) async {
    var client = _newClient();
    late TelaTransaction transaction;
    try {
      print('${Uri.parse(_BASE_URL + _BANK_EPARGNE_URL)} versement epargne');
      http.Response response = await client.post(
        Uri.parse(_BASE_URL + _BANK_EPARGNE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'montant': amount,
          'phone': profile.phone,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        TelaTransaction transac = TelaTransaction.fromJson(json['transaction']);
        print(transac.toString());
        transaction = transac;
      } else {
        print('ERROR reponse status code not 200');
      }
    } catch (e) {
      print('auth api service login error** $e');
    } finally {
      client.close();
    }
    return transaction;
  }

  /// push epargne inverse
  // Future<TelaTransaction?> postVersementFromEpargne({required amount, required TelaBankProfile profile}) async {
  //   var client = _newClient();
  //   late TelaTransaction transaction ;
  //   try{
  //     print('${Uri.parse(_BASE_URL+_BANK_EPARGNE_INVERSE_URL)} push epargne reverse : ');
  //     http.Response response = await client.post(Uri.parse(_BASE_URL+_BANK_EPARGNE_INVERSE_URL),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode({
  //         'montant' : amount,
  //         'phone' : profile.phone,
  //       }),
  //     );
  //     print('Response status: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //     if (response.statusCode == 200) {
  //       final json = jsonDecode(response.body);
  //       print(json);
  //       // _token = 'Bearer '+ json["token"]["access_token"];
  //       TelaTransaction transac = TelaTransaction.fromJson(json["transaction"]);
  //       transaction = transac;
  //       print(transac.toString());
  //
  //     }  else {
  //       print('ERROR reponse status code not 200');
  //     }
  //
  //   }
  //   catch(e){
  //     print('auth api service login error** $e');
  //   }
  //   finally{
  //     client.close();
  //   }
  //   return transaction;
  // }

  /// push abonnement
  Future<Abonnement?> buyAbonnement(
      {required AbonnementType abonnement,
      required TelaTransaction transaction,
      required int userId}) async {
    var client = _newClient();
    Map<String, dynamic> js = transaction.toJson();
    js.addAll(abonnement.toJson2());
    js['user_id'] = userId;
    Abonnement? abonnem;
    try {
      print(
          '${Uri.parse(_BASE_URL + _ABONNEMENT_CREATE_URL)} push abonnement : $js');
      http.Response response = await client.post(
        Uri.parse(_BASE_URL + _ABONNEMENT_CREATE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(js),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        Abonnement abon = Abonnement.fromJson(json['abonnement']);
        // TelaTransaction transac = TelaTransaction.fromJson(json['transaction']);
        _telaSharedPrefs.saveAbonnement(abon);
        // print(transac.toString());
        print(abon.toString());
        abonnem = abon;
      } else {
        print('ERROR reponse status code not 200');
      }
    } catch (e) {
      print('transaction api service buy abonnemet error** $e');
    } finally {
      client.close();
    }
    return abonnem;
  }

  /// push abonnement from Ebank
  Future<Abonnement?> buyAbonnementFromEbank(
      {required AbonnementType abonnement,
      required TelaBankProfile profile,
      required User user,
      required bool fromEpargne}) async {
    var client = _newClient();

    Abonnement? abonnem;
    try {
      print(
          '${Uri.parse(_BASE_URL + _BANK_BUY_ABONNEMENT_URL)} push abonnement ');
      http.Response response = await client.post(
        Uri.parse(_BASE_URL + _BANK_BUY_ABONNEMENT_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'amount': abonnement.price,
          'type_abonnement_id': abonnement.id,
          'user_id': user.id,
          'type': abonnement.type,
          'phone': profile.phone,
          'from_epargne': fromEpargne,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        Abonnement abon = Abonnement.fromJson(json['abonnement']);
        // TelaTransaction transac = TelaTransaction.fromJson(json['transaction']);
        _telaSharedPrefs.saveAbonnement(abon);
        // print(transac.toString());
        print(abon.toString());
        abonnem = abon;
      } else {
        print('ERROR reponse status code not 200');
      }
    } finally {
      client.close();
    }
    return abonnem;
  }

  /// push buy pass
  Future<PassVisite?> buyPassVisite(
      {required PassType pass, required TelaTransaction transaction}) async {
    var client = _newClient();
    Map<String, dynamic> js = transaction.toJson();
    PassVisite? passVisite;
    js.addAll(pass.toJson2());
    try {
      print('${Uri.parse(_BASE_URL + _PASS_CREATE_URL)} buy pass : $js');
      http.Response response = await client.post(
        Uri.parse(_BASE_URL + _PASS_CREATE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(js),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        PassVisite pa = PassVisite.fromJson(json['passvisite']);
        TelaTransaction transac = TelaTransaction.fromJson(json['transaction']);
        print(transac.toString());
        print(pa.toString());
        passVisite = pa;
        await _telaSharedPrefs.savePassVisite(pa);
      } else {
        print('ERROR reponse status code not 200');
      }
    } catch (e) {
      print('transaction api service Buy pass error** $e');
    } finally {
      client.close();
    }
    return passVisite;
  }

  Future<PassVisite?> renewPassVisite(
      {required PassVisite passVisit,
      required PassType pass,
      required TelaTransaction transaction}) async {
    var client = _newClient();
    Map<String, dynamic> js = transaction.toJson();
    PassVisite? passVisite;
    js.addAll(pass.toJson2());
    js.addAll(passVisit.toJson());
    try {
      print(
          '${Uri.parse(_BASE_URL + _PASS_VISITE_PROLONGE_URL)} prolonge pass : $js');
      http.Response response = await client.post(
        Uri.parse(_BASE_URL + _PASS_VISITE_PROLONGE_URL),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(js),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];
        PassVisite pa = PassVisite.fromJson(json['passvisite']);
        TelaTransaction transac = TelaTransaction.fromJson(json['transaction']);
        print(transac.toString());
        print(pa.toString());
        passVisite = pa;
        await _telaSharedPrefs.savePassVisite(pa);
      } else {
        print('ERROR reponse status code not 200');
      }
    } catch (e) {
      print('transaction api service Buy pass error** $e');
    } finally {
      client.close();
    }
    return passVisite;
  }

  /// GET TRANSACTION NUMBER
  Future<String> getTransactionNumber(String type) async {
    var client = _newClient();
    String tn = '';
    try {
      print(
          '${Uri.parse('$_BASE_URL$_TRANSACTION_URL$type/getnumber')} get transaction number');
      http.Response response = await client.get(
        Uri.parse('$_BASE_URL$_TRANSACTION_URL$type/getnumber'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        // _token = 'Bearer '+ json["token"]["access_token"];

        tn = json['transaction_number'];
      } else {
        print('ERROR reponse status code not 200');
      }
    } catch (e) {
      print('auth api service commune error** $e');
      throw ('auth api service commune error** $e');
    } finally {
      client.close();
    }
    return tn;
  }

  // Future<List<TelaEBankTransaction>> getEBankTransactions() async {
  //   var client = _newClient();
  //   List<TelaPlace> places =[];
  //   try{
  //     print('${Uri.parse('$_BASE_URL$_PASS_VISITE_MAISON_URL')} get places visited ${_passVisite!.code}');
  //     http.Response response = await client.post(Uri.parse('$_BASE_URL$_PASS_VISITE_MAISON_URL'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         'code': _passVisite!.code,
  //       }),
  //     );
  //     print('Response status: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //     if (response.statusCode == 200) {
  //       final json = jsonDecode(response.body);
  //       print(json);
  //
  //       for(var pl in json){
  //         TelaPlace tp = TelaPlace.fromJson(pl);
  //         tp.commune = communes.where((element) => element.id == tp.communeId).first;
  //         places.add(tp);
  //         print(pl);
  //       }
  //       _myPlaces = places;
  //     }  else {
  //       print('ERROR reponse status code not 200');
  //       throw json.toString();
  //     }
  //
  //   }
  //   catch(e){
  //     print('place api service place visited error** $e');
  //     throw 'Erreur innatendue';
  //   }
  //   finally{
  //     client.close();
  //   }
  //   return places;
  // }
  // Future<List<TelaEpargneTransaction>> getEBankEpargneTransactions() async {
  //   var client = _newClient();
  //   List<TelaPlace> places =[];
  //   try{
  //     print('${Uri.parse('$_BASE_URL$_PASS_VISITE_MAISON_URL')} get places visited ${_passVisite!.code}');
  //     http.Response response = await client.post(Uri.parse('$_BASE_URL$_PASS_VISITE_MAISON_URL'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         'code': _passVisite!.code,
  //       }),
  //     );
  //     print('Response status: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //     if (response.statusCode == 200) {
  //       final json = jsonDecode(response.body);
  //       print(json);
  //
  //       for(var pl in json){
  //         TelaPlace tp = TelaPlace.fromJson(pl);
  //         tp.commune = communes.where((element) => element.id == tp.communeId).first;
  //         places.add(tp);
  //         print(pl);
  //       }
  //       _myPlaces = places;
  //     }  else {
  //       print('ERROR reponse status code not 200');
  //       throw json.toString();
  //     }
  //
  //   }
  //   catch(e){
  //     print('place api service place visited error** $e');
  //     throw 'Erreur innatendue';
  //   }
  //   finally{
  //     client.close();
  //   }
  //   return places;
  // }
}
