import 'dart:convert';

import '../../../index.dart';

/// An enum that holds names for our custom exceptions.
enum ExceptionType {
  /// The exception for an expired bearer token.
  tokenExpiredException,

  /// The exception for a prematurely cancelled request.
  cancelException,

  /// The exception for a failed connection attempt.
  connectTimeoutException,

  /// The exception for failing to send a request.
  sendTimeoutException,

  /// The exception for failing to receive a response.
  receiveTimeoutException,

  /// The exception for no internet connectivity.
  socketException,

  /// A better name for the socket exception.
  fetchDataException,

  /// The exception for an incorrect parameter in a request/response.
  formatException,

  /// The exception for an unknown type of failure.
  unrecognizedException,

  /// The exception for an unknown exception from the api.
  apiException,

  /// The exception for any parsing failure encountered during
  /// serialization/deserialization of a request.
  serializationException,

  ///
  badResponse,
}

class CustomException implements Exception {
  final String name, message;
  final String? code;
  final int? statusCode;
  final ExceptionType exceptionType;

  CustomException({
    this.code,
    int? statusCode,
    required this.message,
    this.exceptionType = ExceptionType.apiException,
  })  : statusCode = statusCode ?? 500,
        name = exceptionType.name;

  factory CustomException.fromDioException(
    Exception error, {
    bool errorCode = false,
  }) {
    try {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.cancel:
            return CustomException(
              exceptionType: ExceptionType.cancelException,
              statusCode: error.response?.statusCode,
              message: 'Request cancelled prematurely',
            );
          case DioExceptionType.connectionTimeout:
            return CustomException(
              exceptionType: ExceptionType.connectTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Connection not established',
            );
          case DioExceptionType.sendTimeout:
            return CustomException(
              exceptionType: ExceptionType.sendTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to send',
            );
          case DioExceptionType.receiveTimeout:
            return CustomException(
              exceptionType: ExceptionType.receiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to receive',
            );
          case DioExceptionType.badResponse:
            String? res =
                errorMsg(error.response, errorCode: errorCode) ?? error.message;
            return CustomException(
              message: '$res',
              statusCode: error.response?.statusCode,
              exceptionType: ExceptionType.badResponse,
            );
          case DioExceptionType.badCertificate:
          case DioExceptionType.connectionError:
          case DioExceptionType.unknown:
            if (error.message?.contains(ExceptionType.socketException.name) ==
                true) {
              return CustomException(
                exceptionType: ExceptionType.fetchDataException,
                statusCode: error.response?.statusCode,
                message: 'No internet connectivity',
              );
            }
            return CustomException(
              exceptionType: ExceptionType.fetchDataException,
              statusCode: error.response?.statusCode,
              message: error.response?.data?['errors'].toString() ??
                  error.message.toString(),
            );
        }
      } else {
        return CustomException(
          exceptionType: ExceptionType.unrecognizedException,
          message: 'Error unrecognized',
        );
      }
    } on FormatException catch (e) {
      return CustomException(
        exceptionType: ExceptionType.formatException,
        message: e.message,
      );
    } on Exception catch (_) {
      return CustomException(
        exceptionType: ExceptionType.unrecognizedException,
        message: 'Error unrecognized',
      );
    }
  }

  factory CustomException.fromParsingException(Exception error) {
    debugPrint('$error');
    return CustomException(
      exceptionType: ExceptionType.serializationException,
      message: 'Failed to parse network response to model or vice versa',
    );
  }

  static String? errorMsg(Response? response, {bool errorCode = false}) {
    if (response == null || response.data == null) {
      return null;
    }
    Map<String, dynamic> json = <String, dynamic>{};
    if (response.data is String) {
      json = response.data.isEmpty ? {} : jsonDecode(response.data);
    } else if (response.data is Map<String, dynamic>) {
      json = response.data;
    }

    dynamic msg;
    if (json.containsKey("error")) {
      msg = json["error"];
      if (msg is String) {
        return msg;
      } else {
        msg as Map<String, dynamic>;
        if (msg.keys.isNotEmpty) {
          return msg[msg.keys.first].toString();
        }
      }
    } else if (json.containsKey("errors")) {
      msg = json["errors"];

      if (msg is String) {
        return msg;
      } else {
        msg as Map<String, dynamic>;
        if (msg.keys.isNotEmpty) {
          return errorCode ? msg.keys.first : msg[msg.keys.first].toString();
        }
      }
    }
    return null;
  }

  static ApiResponse<T> createFromEx<T>(
    Exception ex, {
    bool errorCode = false,
  }) {
    var error = CustomException.fromDioException(
      ex,
      errorCode: errorCode,
    );
    return ApiResponse.error(message: error.message);
  }
}
