import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_api1/presentation/home_screen/view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController with ChangeNotifier {
  late SharedPreferences sharedPreferences;
  postData(phone, passWord, context) async {
    var body = {"phone": phone, "password": passWord};
    final Url = Uri.parse(
        "https://studyappmw.dev.luminartechnohub.com/api/v1/user/login/");
    final response = await http.post(Url, body: body);
    if (response.statusCode == 200) {
      log("login success");
      var decodedData = jsonDecode(response.body);
      // storeLoginData(decodedData);
      storeLoginData(decodedData["data"]);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      return decodedData;
    } else {
      log("Login failed");
    }
  }

  storeLoginData(decodedData) async {
    sharedPreferences = await SharedPreferences.getInstance();
    String data = jsonEncode(decodedData);
    log("data -> $data");
    sharedPreferences.setString("loginData", data);
  }

  // getStoredData() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   String? access = sharedPreferences.getString("loginData");
  //   log("access -> $access");
  //   return access;
  // }
}
