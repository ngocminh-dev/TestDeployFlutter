import 'dart:convert';

import '../../../../index.dart';

/// Log Level
enum Level {
  /// No logs.
  none,

  /// Logs request and response lines.
  ///
  /// Example:
  ///  ```
  ///  --> POST /greeting
  ///
  ///  <-- 200 OK
  ///  ```
  basic,

  /// Logs request and response lines and their respective headers.
  ///
  ///  Example:
  /// ```
  /// --> POST /greeting
  /// Host: example.com
  /// Content-Type: plain/text
  /// Content-Length: 3
  /// --> END POST
  ///
  /// <-- 200 OK
  /// Content-Type: plain/text
  /// Content-Length: 6
  /// <-- END HTTP
  /// ```
  headers,

  /// Logs request and response lines and their respective headers and bodies (if present).
  ///
  /// Example:
  /// ```
  /// --> POST /greeting
  /// Host: example.com
  /// Content-Type: plain/text
  /// Content-Length: 3
  ///
  /// Hi?
  /// --> END POST
  ///
  /// <-- 200 OK
  /// Content-Type: plain/text
  /// Content-Length: 6
  ///
  /// Hello!
  /// <-- END HTTP
  /// ```
  body,
}

/// DioLoggingInterceptor
/// Simple logging interceptor for dio.
///
/// Inspired the okhttp-logging-interceptor and referred to pretty_dio_logger.
class LoggingInterceptor extends Interceptor {
  /// Log Level
  final Level level;

  /// Log printer; defaults logPrint log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file.
  void Function(Object object) logPrint;

  /// Print compact json response
  final bool compact;

  final JsonDecoder decoder = const JsonDecoder();
  final JsonEncoder encoder = const JsonEncoder.withIndent('  ');

  LoggingInterceptor({
    this.level = Level.none,
    this.compact = true,
    this.logPrint = print,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (level == Level.none) return handler.next(options);

    logPrint('[DIO]--> ${options.method} ${options.uri}');

    if (level == Level.basic) return handler.next(options);

    if (level == Level.headers) {
      logPrint('[DIO]--> END ${options.method}');
      return handler.next(options);
    }

    final data = options.data;

    if (data != null) {
      // logPrint('[DIO]dataType:${data.runtimeType}');
      if (data is Map) {
        if (compact) {
          logPrint('[DIO][Request]${jsonEncode(data)}');
        } else {
          _prettyPrintJson(data);
        }
      } else if (data is FormData) {
        logPrint('[DIO][Request]${jsonEncode(data)}');
      } else {
        logPrint('[DIO][Request]${jsonEncode(data)}');
      }
    }

    logPrint('[DIO]--> END ${options.method}');

    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (level == Level.none) return handler.next(response);

    logPrint(
        '[DIO Response status]<-- ${response.statusCode} ${(response.statusMessage?.isNotEmpty ?? false) ? response.statusMessage : ''}');

    if (level == Level.basic) return handler.next(response);

    if (level == Level.headers) {
      logPrint('[DIO]--> END HTTP');
      return handler.next(response);
    }

    final data = response.data;
    if (data != null) {
      // logPrint('[DIO]dataType:${data.runtimeType}');
      if (data is Map) {
        if (compact) {
          // Use toString instead of jsonEncode, as MultiPart file cannot be encoded
          try {
            logPrint('[DIO][Request]${jsonEncode(data)}');
          } on Exception catch (_) {
            logPrint('[DIO][Request]${data.toString()}');
          }
        } else {
          logPrint('[DIO][Response]');
          try {
            _prettyPrintJson(data);
          } catch (e) {
            log(e.toString());
          }
        }
      } else if (data is List) {
        // NOT IMPLEMENT
      } else if (data is FormData) {
        // NOT IMPLEMENT
      } else {
        logPrint('[DIO][Response]${data.toString()}');
      }
    }

    logPrint('[DIO]<-- END HTTP');
    return handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (level == Level.none) return handler.next(err);

    try {
      logPrint('[DIO]<-- HTTP FAILED: ${jsonEncode(err.response?.data)}');
    } catch (_) {
      logPrint('[DIO]<-- HTTP FAILED: ${err.response?.data.toString()}');
    }

    return handler.next(err);
  }

  void _prettyPrintJson(Object input) {
    var prettyString = encoder.convert(input);
    prettyString.split('\n').forEach((element) => logPrint(element));
  }
}
