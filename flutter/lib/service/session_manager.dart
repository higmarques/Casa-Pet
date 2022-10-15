import 'package:flutter/material.dart';

class SessionManager {
  static String? _token;
  static BuildContext? _context;

  static setContext(BuildContext context) {
    _context = context;
  }

  static getToken() {
    if (_token == null) {
      Navigator.of(_context!).popUntil((route) => false);
    }
    return _token;
  }

  static setToken(String token) {
    _token = token;
  }

  static clearToken() {
    _token = null;
  }
}
