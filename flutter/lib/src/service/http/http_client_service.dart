import 'package:dio/dio.dart';
import 'package:event_tracker/src/service/util/custom_content_type.dart';

abstract class HTTPClientService {
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic> queryParams,
    String baseUrl,
  });

  Future<Response<dynamic>> post(
    String url, {
    dynamic body,
    CustomContentType contentType,
    Map<String, dynamic> queryParams,
  });

  Future<Response<dynamic>> put(
    String url, {
    dynamic body,
    CustomContentType contentType,
    Map<String, dynamic> queryParams,
  });

  Future<Response<dynamic>> delete(
    String url, {
    dynamic body,
    Map<String, dynamic> queryParams,
  });

  Dio get client;
}
