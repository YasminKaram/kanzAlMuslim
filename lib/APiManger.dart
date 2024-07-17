import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/radioModel.dart';

class ApiManger {
  static Future<List<Radios>?> getRadios() async {
    try {
      final url = Uri.https("mp3quran.net", "/api/v3/radios");
      http.Response response = await http.get(url);
      RadioModel radioModel = RadioModel.fromJson(jsonDecode(response.body));
      return radioModel.radios;
    } catch (e) {
      print(e);
    }
  }
}
