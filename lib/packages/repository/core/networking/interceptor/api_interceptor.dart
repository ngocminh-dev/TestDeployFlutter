import '../../../../index.dart';

class ApiInterceptor extends Interceptor {
  final String? secretKey;
  final String? accessToken;

  ApiInterceptor({this.secretKey, this.accessToken}) : super();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({
      'Accept-Language': Intl.getCurrentLocale(),
      if (secretKey != null && secretKey!.isNotEmpty)
        'X-MOBILE-SECRET': secretKey,
      if (accessToken != null && accessToken!.isNotEmpty)
        'Authorization': 'Bearer ${accessToken!}',
    });
    return handler.next(options);
  }
}
