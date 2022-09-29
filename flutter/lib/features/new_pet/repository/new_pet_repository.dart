import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:event_tracker/features/new_pet/models/models.dart';
import 'package:event_tracker/service/http.dart';
import 'package:event_tracker/service/util/custom_content_type.dart';

class NewPetRepository {
  NewPetRepository(this._http);
  final HTTPClientService _http;

  Future<bool> register(NewPetRequestModel request) async {
    try {
      final Response<dynamic> response = await _http.post(
        Endpoints.registerNewPet,
        contentType: CustomContentType.applicationJson,
        body: jsonEncode(request.toJson()),
      );

      return response.statusCode == 201;
    } catch (_) {
      return false;
    }
  }
}
