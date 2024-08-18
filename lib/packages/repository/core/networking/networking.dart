import '../../../index.dart';

export 'custom_exception.dart';
export 'dio_service.dart';

class NetworkSrc {
  static NetworkSrc instance() {
    return NetworkSrc();
  }

  late final _baseOptions = BaseOptions(
    baseUrl: Config.baseUrl,
    contentType: 'application/json',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );
  late final _commonOptions = BaseOptions(
    baseUrl: Config.commonUrl,
    contentType: 'application/json',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );
  late final _downloadBaseOptions = BaseOptions(
    // baseUrl: Config.downloadBaseUrl,
    // contentType: 'application/json',
    responseType: ResponseType.bytes,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    validateStatus: (status) {
      return status != null && status < 500;
    },
  );

  late final Dio _dio;

  late final DioService _dioService;

  late final Dio _downloadDio;

  late final DioService _downloadDioService;

  late final Dio _commonDio;

  late final DioService _commonDioService;

  /*final _cacheOptions = CacheOptions(
    store: null,
    // store: HiveCacheStore(getApplicationDocumentsDirectory().path),
    policy: CachePolicy.noCache, // Bcz we force cache on-demand in repositories
    maxStale: const Duration(days: 30), // No of days cache is valid
    keyBuilder: (options) => options.path,
  );
*/
  NetworkSrc() {
    _dio = Dio(_baseOptions);
    //_downloadDio = Dio(_baseOptions);
    _dioService = DioService(dioClient: _dio, interceptors: [
      ApiInterceptor(secretKey: Config.secretKey, accessToken: Config.accessToken),
      // DioCacheInterceptor(options: _cacheOptions),
      // if (kDebugMode) LoggingInterceptor(),
      LoggingInterceptor(level: Level.body, compact: true),
    ]);
    _downloadDio = Dio(_downloadBaseOptions);
    _downloadDioService =
        DioService(dioClient: _downloadDio, interceptors: null);
    _commonDio = Dio(_commonOptions);
    _commonDioService = DioService(dioClient: _commonDio,interceptors: [
      ApiInterceptor(secretKey: Config.secretKey),
      // DioCacheInterceptor(options: _cacheOptions),
      // if (kDebugMode) LoggingInterceptor(),
      LoggingInterceptor(level: Level.body, compact: true),
    ]);
  }

  DioService get dioService => _dioService;

  DioService get downloadDioService => _downloadDioService;

  DioService get commonDioService => _commonDioService;
}
