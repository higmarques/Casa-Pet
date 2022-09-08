import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:event_tracker/features/login/login.dart';
import 'package:event_tracker/service/http.dart';
import 'package:event_tracker/service/util/custom_content_type.dart';

class LoginRepository {
  LoginRepository(this._http);
  final HTTPClientService _http;

  Future<bool> login(LoginModel request) async {
    final Response<dynamic> response = await _http.post(
      Endpoints.login,
      contentType: CustomContentType.applicationJson,
      body: jsonEncode(request.toJson()),
    );

    return response.statusCode == 200;
  }
}
