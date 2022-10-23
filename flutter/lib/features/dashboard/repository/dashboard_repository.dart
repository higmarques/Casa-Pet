import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:event_tracker/features/dashboard/dashboard.dart';
import 'package:event_tracker/service/http.dart';

class DashboardRepository {
  DashboardRepository(this._http);
  final HTTPClientService _http;

  Future<List<DashboardPet>?> getPetsList() async {
    try {
      final Response<dynamic> response = await _http.get(
        Endpoints.getPetsList,
      );

      if (response.statusCode != 200) {
        return null;
      }

      var petList = DashboardGetPetsListResponse.fromJson(response.data);

      return petList.pets;
    } catch (error) {
      return null;
    }
  }
}
