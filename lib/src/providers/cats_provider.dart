import 'dart:convert';
import 'package:http/http.dart' as http;

class CatsProvider {
  final String api = 'https://api.thecatapi.com/v1';

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
    return valores;
  }
}
