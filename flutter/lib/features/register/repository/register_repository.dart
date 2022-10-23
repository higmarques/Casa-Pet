import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:event_tracker/features/register/models/models.dart';
import 'package:event_tracker/service/http.dart';
import 'package:event_tracker/service/util/custom_content_type.dart';
import 'package:event_tracker/utils/utils.dart';

class RegisterRepository {
  RegisterRepository(this._http);
  final HTTPClientService _http;

  Future<String> register(RegisterRequestModel request) async {
    try {
      final Response<dynamic> response = await _http.post(
        Endpoints.register,
        contentType: CustomContentType.applicationJson,
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode != 201) {
        return BaseStrings.empty;
      }

      final body = RegisterResponseModel.fromJson(response.data);

      return body.user.token;
    } catch (_) {
      return BaseStrings.empty;
    }
  }
}
