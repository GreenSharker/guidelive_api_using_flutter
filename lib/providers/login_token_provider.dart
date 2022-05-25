import 'package:flutter/material.dart';

class LoginTokenProvider with ChangeNotifier {
  String? _token;

  String? get getToken => _token;

  void setToken(String token) {
    _token = token.toString().replaceAll("\"", "");
    notifyListeners();
  }
}
