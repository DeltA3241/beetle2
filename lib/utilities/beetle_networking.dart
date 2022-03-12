import 'dart:convert';

import 'package:beetle/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:beetle/globals.dart' as global;

class BeetleNetworking {
  Future<http.Response> signupUser(Map<String, String?> signupData) async {
    http.Response response = await http.post(
      Uri.parse('$kBaseUrl/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(signupData),
    );
    return response;
  }

  Future<http.Response> createForum(Map<String, dynamic> forumData) async {
    String basicAuth = this.basicAuth(global.username, global.password);
    http.Response response = await http.post(
      Uri.parse('$kBaseUrlForum/forums'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(forumData),
    );
    return response;
  }

  Future<http.Response> addComment(
      Map<String, String> commentData, String forumID) async {
    String basicAuth = this.basicAuth(global.username, global.password);
    http.Response response = await http.post(
      Uri.parse('$kBaseUrlForum/forums/$forumID/comments'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(commentData),
    );
    return response;
  }

  Future<dynamic> getImage(String imageId) async {
    String basicAuth = this.basicAuth(global.username, global.password);
    http.Response response = await http.get(
      Uri.parse('$kBaseUrlForum/image/$imageId'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }

  Future<http.Response> loginUser(String email, String password) async {
    String basicAuth = this.basicAuth(email, password);
    http.Response response = await http.post(
      Uri.parse('$kBaseUrl/login/'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Accept': 'application/json'
      },
    );
    return response;
  }

  Future<http.Response> resetUserPassword(String email) async {
    http.Response response = await http.post(
      Uri.parse('$kBaseUrl/recover/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "email": email,
        },
      ),
    );
    return response;
  }

  Future<dynamic> getForums() async {
    http.Response response = await http.get(Uri.parse('$kBaseUrlForum/forums'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return 'error';
    }
  }

  static Future<dynamic> getForumComents(String forumId) async {
    http.Response response =
        await http.get(Uri.parse('$kBaseUrlForum/forums/$forumId'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return 'error';
    }
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
