// import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CatsProvider {
  // final storage = new FlutterSecureStorage();
  final String api = 'https://api.thecatapi.com/v1';
  // final String apikey = dotenv.env['API_KEY'] ?? 'API_KEY no encontrado';
  // String token = '';

  // Future<void> _initToken() async {
  //   token = await storage.read(key: 'token') ?? 'sin_token';
  // }

  // Future<Map<String, String>> _inicializarTokenHead() async {
  //   if (token.isEmpty) {
  //     await _initToken();
  //   }
  //   return headers();
  // }

  // Map<String, String> headers() {
  //   return {
  //     'Content-Type': 'application/json',
  //     HttpHeaders.authorizationHeader: 'JWT $token',
  //     "x-api-key": apikey,
  //   };
  // }

  Future<List<dynamic>> getCats() async {
    List<dynamic> valores = [];
    final resp = await http.get(
      Uri.parse('$api/breeds'),
    );
    if (resp.statusCode == 200) {
      valores = json.decode(resp.body);
    }
    return valores;
  }

    Future<List<dynamic>> getImgCat(String id) async {
    List<dynamic> valores = [];
    final resp = await http.get(
      Uri.parse('$api/images/search?breed_ids=$id'),
    );
    if (resp.statusCode == 200) {
      valores = json.decode(resp.body);
    }
    print(valores);
    return valores;
  }

}