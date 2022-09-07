// ignore_for_file: avoid_dynamic_calls
// TODO(maiara): ajustar erros

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:event_tracker/src/service/exceptions/custom_exceptions.dart';
import 'package:event_tracker/src/service/http/http_error_handler.dart';
import 'package:event_tracker/src/utils/Strings.dart';

class DioHttpErrorHandler extends HttpErrorHandler {
  @override
  Future<Exception> handleError(dynamic error) async {
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      return ConnectivityException(Strings.empty);
    }

    if (error?.response?.statusCode == HttpStatus.notFound) {
      return NotFoundException(error.response.data.toString(),
          <String>[error.response.statusCode.toString()]);
    }

    if (error?.response?.statusCode == HttpStatus.badRequest) {
      return BadRequestException(error.response.data.toString(), <String>[
        error.response.statusCode.toString(),
      ]);
    }

    if (error?.error == DioErrorType.connectTimeout) {
      return ConnectionException(
          'Request to ${error.requestOptions.path} timed out');
    }

    return Exception(error.message);
  }
}
