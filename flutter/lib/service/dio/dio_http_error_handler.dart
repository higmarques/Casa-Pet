import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:event_tracker/service/exceptions/custom_exceptions.dart';
import 'package:event_tracker/service/http/http_error_handler.dart';
import 'package:event_tracker/utils/utils.dart';

class DioHttpErrorHandler extends HttpErrorHandler {
  @override
  Future<Exception> handleError(dynamic error) async {
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      return ConnectivityException(BaseStrings.empty);
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
