import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  LoggerInterceptor();

  final bool isLogActive = true;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logOnRequest(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    logOnResponse(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logOnError(err);
    super.onError(err, handler);
  }

  void logOnRequest(RequestOptions options) {
    if (!isLogActive) return;
    log('\n');
    log('HTTP REQUEST');
    log('Method: ${options.method}');
    log('URL: ${options.uri}');
    log('Response type: ${options.responseType}');
    log('Headers: ${options.headers}');
    log('Body: ${options.data}');
    log('\n');
  }

  void logOnResponse(Response<dynamic> response) {
    if (!isLogActive) return;
    log('\n');
    log('HTTP RESPONSE');
    log('--> Request Info <--');
    log('Method: ${response.requestOptions.method}');
    log('URL: ${response.requestOptions.uri}');
    log('ResponseType: ${response.requestOptions.responseType}');
    log('Headers: ${response.requestOptions.headers}');
    log('Body: ${response.requestOptions.data}');
    log('--> Response Info <--');
    log('StatusCode: ${response.statusCode}');
    log('Body: ${response.data}');
    log('\n');
  }

  void logOnError(DioError err) {
    if (!isLogActive) return;
    log('HTTP ERROR');
    log('--> Request Info <--');
    log('Method: ${err.requestOptions.method}');
    log('URL: ${err.requestOptions.uri}');
    log('ResponseType: ${err.requestOptions.responseType}');
    log('Headers: ${err.requestOptions.headers}');
    log('Body: ${err.requestOptions.data}');
    log('--> ResponseInfo <--');
    log('StatusCode: ${err.response?.statusCode}');
    log('Body: ${err.response?.data}');
    log('--> Error Info <--');
    log('ErrorType: ${err.type}');
    log('Body: ${err.error}');
    log('\n');
  }
}
