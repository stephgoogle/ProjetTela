import 'dart:convert';
import 'dart:io';

import 'package:mobile/models/pub_pack.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
class PubService {

    static const String _BASE_URL = "http://back.telaci.com/api/";
      bool _certificateCheck(X509Certificate cert, String host, int port) => true;


     /// CREATE A NEW HTTP CLIENT FOR CALLS
  http.Client _newClient() {
    var ioClient = HttpClient()..badCertificateCallback = _certificateCheck;

    return IOClient(ioClient);  
  }


  Future<bool> souscription(PackSouscription data) async {
    var client = _newClient();
    String endPoint = "souscription_pack_publicitaire/create";
    try {
      http.Response response = await client.post(
        Uri.parse('$_BASE_URL$endPoint'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data.create()),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        if (response.body != '{}') {
          return true;
        }
      } else {
        print('ERROR reponse status code not 200');
        return false;
      }
    } catch (e) {
      print('auth api service verif code error** $e');
      return false;
    } finally {
      client.close();
    }

    return false;
  }

}