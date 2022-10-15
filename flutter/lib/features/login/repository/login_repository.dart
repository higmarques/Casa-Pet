import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:event_tracker/features/login/models/models.dart';
import 'package:event_tracker/service/http.dart';
import 'package:event_tracker/service/util/custom_content_type.dart';
import 'package:event_tracker/utils/utils.dart';

class LoginRepository {
  LoginRepository(this._http);
  final HTTPClientService _http;

  Future<String> login(LoginRequestModel request) async {
    try {
      final Response<dynamic> response = await _http.post(
        Endpoints.login,
        contentType: CustomContentType.applicationJson,
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode != 200) {
        return BaseStrings.empty;
      }

      final body = LoginResponseModel.fromJson(response.data);

      return body.token;
    } catch (_) {
      return BaseStrings.empty;
    }
  }
}
