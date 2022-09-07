import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:event_tracker/features/login/login.dart';
import 'package:event_tracker/service/http.dart';

class LoginRepository {
  LoginRepository(this._http);
  final HTTPClientService _http;

  Future<bool> login(LoginModel request) async {
    final Response<dynamic> response = await _http.post(
      Endpoints.login,
      body: jsonEncode(request.toJson()),
    );

    return response.statusCode == 200;
  }
}
