import 'package:dio/dio.dart';
import 'package:event_tracker/service/http/http_client_service.dart';
import 'package:event_tracker/service/http/http_error_handler.dart';
import 'package:event_tracker/service/util/custom_content_type.dart';
import 'package:event_tracker/service/util/endpoints.dart';

class DioHttpClientService implements HTTPClientService {
  DioHttpClientService(
      this._client, List<Interceptor> interceptors, this._httpErrorHandler) {
    _client = _client
      ..interceptors.addAll(interceptors)
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = 60 * 500
      ..options.receiveTimeout = 60 * 500;
  }

  Dio _client;
  final HttpErrorHandler _httpErrorHandler;

  Future<void> _setupHeaders({
    CustomContentType? contentType,
  }) async {
    final Map<String, dynamic> headers = _client.options.headers;
    headers[Headers.contentTypeHeader] = contentType?.headerParameter;
    _client.options.headers = headers;
  }

  @override
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParams,
    String? baseUrl,
  }) async {
    _setupHeaders();
    _client.options.baseUrl = baseUrl ?? Endpoints.baseUrl;
    try {
      final Response<dynamic> response =
          await _client.get(url, queryParameters: queryParams);
      return response;
    } on DioError catch (e) {
      throw await _httpErrorHandler.handleError(e);
    }
  }

  @override
  Future<Response<dynamic>> post(
    String url, {
    dynamic body,
    CustomContentType contentType = CustomContentType.applicationJson,
    Map<String, dynamic> queryParams = const <String, dynamic>{},
  }) async {
    _setupHeaders(contentType: contentType);
    _client.options.baseUrl = Endpoints.baseUrl;
    try {
      final Response<dynamic> response = await _client.post(
        url,
        data: body,
        queryParameters: queryParams,
      );
      return response;
    } on DioError catch (e) {
      throw await _httpErrorHandler.handleError(e);
    }
  }

  @override
  Future<Response<dynamic>> put(
    String url, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    CustomContentType contentType = CustomContentType.applicationJson,
  }) async {
    _setupHeaders(contentType: contentType);

    try {
      final Response<dynamic> response = await _client.put(
        url,
        data: body,
        queryParameters: queryParams,
      );
      return response;
    } on DioError catch (e) {
      throw await _httpErrorHandler.handleError(e);
    }
  }

  @override
  Future<Response<dynamic>> delete(
    String url, {
    dynamic body,
    Map<String, dynamic>? queryParams,
  }) async {
    _setupHeaders();

    try {
      final Response<dynamic> response =
          await _client.delete(url, queryParameters: queryParams);
      return response;
    } on DioError catch (e) {
      throw await _httpErrorHandler.handleError(e);
    }
  }

  @override
  Dio get client => _client;
}
