import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {

  final _httpClient = http.Client();

  Future<dynamic> get(String url) async {
    var uriUrl = Uri.parse(url);
    try {
      final response = await _httpClient.get(uriUrl);
      if(response.statusCode >= 200 && response.statusCode < 400){
        return response;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

}