import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:event_tracker/features/register/models/models.dart';
import 'package:event_tracker/service/http.dart';
import 'package:event_tracker/service/util/custom_content_type.dart';

class RegisterRepository {
  RegisterRepository(this._http);
  final HTTPClientService _http;

  Future<bool> register(RegisterModel request) async {
    final Response<dynamic> response = await _http.post(
      Endpoints.register,
      contentType: CustomContentType.applicationJson,
      body: jsonEncode(request.toJson()),
    );

    return response.statusCode == 200;
  }
}
