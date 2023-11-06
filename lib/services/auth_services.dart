import 'dart:convert';

import 'package:pms/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:pms/Api/api_url.dart';

class AuthServices {
  static Future<String> login({String? email, String? password}) async {
    String _result = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = {
      "username": email,
      "password": password,
    };
    http.Response response;
    int code;
    response = await http.post(ApiUrl.login,
        headers: {"Content-Type": "application/json"}, body: json.encode(data));
    final Map<String, dynamic> authResponseData = json.decode(response.body);
    code = authResponseData["status-code"];
    if (code == 200) {
      //   print(authResponseData);
      int userId = authResponseData["value"]["userId"];
      UserModel().accessToken = authResponseData["value"]["accessToken"];
      String accessToken = authResponseData["value"]["accessToken"];
      UserModel().tokenType = authResponseData["value"]["tokenType"];
      // print(UserModel().tokenType);
      UserModel().email = authResponseData["value"]["email"];
      prefs.setInt("uid", userId);
      prefs.setString("accessToken", accessToken);
      UserModel().id = userId.toString();
      _result = authResponseData['message'];
    } else {
      UserModel().errorMessage = authResponseData['message'];
      _result = authResponseData['message'];
    }
    return _result;
  }

  Future callApiSignOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = {
      "userId": prefs.getInt("uid"),
    };
    // var  response =
    await http.post(
      ApiUrl.logout,
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    // final Map<String, dynamic> authResponseData = json.decode(response.body);
    // print(authResponseData);
  }
}
