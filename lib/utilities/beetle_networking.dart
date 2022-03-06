import 'dart:convert';

import 'package:beetle/utilities/constants.dart';
import 'package:http/http.dart' as http;

class BeetleNetworking {
  Future<http.Response> signupUser(Map<String, String?> signupData) async {
    http.Response response = await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode(signupData),
    );
    return response;
  }

  Future<http.Response> loginUser(String email, String password) async {
    String basicAuth = this.basicAuth(email, password);
    http.Response response = await http.post(
      Uri.parse('$baseUrl/login/'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Accept': 'application/json'
      },
    );
    return response;
  }

  String basicAuth(String username, String password) {
    String basicAuth = 'Basic ' +
        base64Encode(
          utf8.encode(
            '$username:$password',
          ),
        );
    return basicAuth;
  }
}
