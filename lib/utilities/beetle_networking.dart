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
      Map<String, dynamic> commentData, String forumID) async {
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

  // Future<http.Response> getOrders(String email, String password) async {
  //   String basicAuth = this.basicAuth('Ahmad@email.com', 'Pass123@');
  //   http.Response response = await http.get(
  //     Uri.parse('https://beetle-shop.azurewebsites.net/shop/user/orders'),
  //     headers: <String, String>{
  //       'authorization': basicAuth,
  //       'Accept': 'application/json'
  //     },
  //   );
  //   return response;
  // }

  Future<http.Response> deleteComment(String forumId, String commentId) async {
    String basicAuth = this.basicAuth(global.username, global.password);
    http.Response response = await http.delete(
      Uri.parse('$kBaseUrlForum/forums/$forumId/comments/$commentId'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Accept': 'application/json'
      },
    );
    return response;
  }

  Future<dynamic> updatePassword(String password) async {
    String basicAuth = this.basicAuth(global.username, global.password);
    http.Response response = await http.post(
      Uri.parse('$kBaseUrl/update/pass'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Accept': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          "update": password,
        },
      ),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }

  Future<http.Response> updateComment(String forumId, String commentId,
      Map<String, String> updatedComment) async {
    String basicAuth = this.basicAuth(global.username, global.password);
    http.Response response = await http.put(
      Uri.parse('$kBaseUrlForum/forums/$forumId/comments/$commentId'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Accept': 'application/json'
      },
      body: jsonEncode(updatedComment),
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

  Future<dynamic> getForums(String search) async {
    http.Response response;
    if (search == '?search=') {
      response = await http.get(
        Uri.parse(
          '$kBaseUrlForum/forums',
        ),
      );
    } else {
      response = await http.get(
        Uri.parse(
          '$kBaseUrlForum/forums$search',
        ),
      );
    }

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

  Future<http.Response> deleteForum(String forumId) async {
    String basicAuth = this.basicAuth(global.username, global.password);
    http.Response response = await http.delete(
      Uri.parse('$kBaseUrlForum/forums/$forumId'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Accept': 'application/json'
      },
    );
    return response;
  }

  Future<http.Response> report(String id) async {
    String basicAuth = this.basicAuth(global.username, global.password);
    http.Response response = await http.post(
      Uri.parse('$kBaseUrlForum/comments/report'),
      headers: <String, String>{
        'authorization': basicAuth,
        'Accept': 'application/json'
      },
      body: jsonEncode(
        <String, String>{
          'comment_id': id,
        },
      ),
    );
    return response;
  }

  Future<dynamic> getDetails(Map<String, String> details) async {
    String basicAuth = this.basicAuth(global.username, global.password);
    http.Response response = await http.post(
      Uri.parse(kDiseaseDetectionBaseURL),
      headers: <String, String>{
        'authorization': basicAuth,
        'Accept': 'application/json'
      },
      body: jsonEncode(details),
    );
    print(response.statusCode);
    return jsonDecode(
      utf8.decode(response.bodyBytes),
    );
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
