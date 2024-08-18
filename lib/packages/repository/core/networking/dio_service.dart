import '../../../index.dart';
import '../helper/index.dart';
import 'custom_exception.dart';

/// A service class that wraps the [Dio] instance and provides methods for
/// basic network requests.
class DioService {
  /// An instance of [Dio] for executing network requests.
  final Dio _dio;

  /// A set of cache options to be used for each request
  final CacheOptions? globalCacheOptions;

  /// An instance of [CancelToken] used to pre-maturely cancel
  /// network requests.
  final CancelToken _cancelToken;

  /// A public constructor that is used to create a Dio service and initialize
  /// the underlying [Dio] client.
  ///
  /// * [interceptors]: An [Iterable] for attaching custom
  /// [Interceptor]s to the underlying [_dio] client.
  /// * [httpClientAdapter]: Replaces the underlying [HttpClientAdapter] with
  /// this custom one.
  DioService({
    required Dio dioClient,
    this.globalCacheOptions,
    Iterable<Interceptor>? interceptors,
    HttpClientAdapter? httpClientAdapter,
  })  : _dio = dioClient,
        _cancelToken = CancelToken() {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
    if (httpClientAdapter != null) _dio.httpClientAdapter = httpClientAdapter;
  }

  /// This method invokes the [cancel()] method on either the input
  /// [cancelToken] or internal [_cancelToken] to pre-maturely end all
  /// requests attached to this token.
  void cancelRequests({CancelToken? cancelToken}) {
    if (cancelToken == null) {
      _cancelToken.cancel('Cancelled');
    } else {
      cancelToken.cancel();
    }
  }

  Future<JSON> get({
    required String endpoint,
    JSON? queryParams,
    Options? options,
    CacheOptions? cacheOptions,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get<JSON>(
      endpoint,
      queryParameters: queryParams,
      options: _mergeDioAndCacheOptions(
        dioOptions: options,
        cacheOptions: cacheOptions,
      ),
      cancelToken: cancelToken ?? _cancelToken,
    );
    // Status code 204 = success but returns null response
    if (response.data == null &&
        response.statusCode != 204 &&
        response.statusCode != 200) {
      throw CustomException(message: "Response data is null");
    }
    return response.data ?? {};
  }

  Future<List<T>> getList<T>({
    required String endpoint,
    JSON? queryParams,
    Options? options,
    CacheOptions? cacheOptions,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get(
      endpoint,
      queryParameters: queryParams,
      options: _mergeDioAndCacheOptions(
        dioOptions: options,
        cacheOptions: cacheOptions,
      ),
      cancelToken: cancelToken ?? _cancelToken,
    );

    // Status code 204 = success but returns null response
    if (response.data == null &&
        response.statusCode != 204 &&
        response.statusCode != 200) {
      throw CustomException(message: "Response data is null");
    }
    if (response.data == null) {
      return [];
    }
    List<T> result = List<T>.from(response.data);
    return result;
  }

  Future<T?> getT<T>({
    required String endpoint,
    JSON? queryParams,
    Options? options,
    CacheOptions? cacheOptions,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get<T>(
      endpoint,
      queryParameters: queryParams,
      options: _mergeDioAndCacheOptions(
        dioOptions: options,
        cacheOptions: cacheOptions,
      ),
      cancelToken: cancelToken ?? _cancelToken,
    );
    // Status code 204 = success but returns null response
    if (response.data == null &&
        response.statusCode != 204 &&
        response.statusCode != 200) {
      throw CustomException(message: "Response data is null");
    }
    return response.data;
  }

  Future<JSON> post({
    required String endpoint,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post<JSON>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    // Status code 204 = success but returns null response
    if (response.data == null &&
        response.statusCode != 204 &&
        response.statusCode != 200) {
      throw CustomException(message: "Response data is null");
    }
    return response.data ?? {};
  }

  Future<List<T>> mPost<T>({
    required String endpoint,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    // Status code 204 = success but returns null response
    if (response.data == null &&
        response.statusCode != 204 &&
        response.statusCode != 200) {
      throw CustomException(message: "Response data is null");
    }
    if (response.data == null)
      {
        return [];
      }
    List<T> result = List<T>.from(response.data);
    return result;
  }

  Future<T?> postT<T>({
    required String endpoint,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post<T>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    // Status code 204 = success but returns null response
    if (response.data == null &&
        response.statusCode != 204 &&
        response.statusCode != 200) {
      throw CustomException(message: "Response data is null");
    }
    return response.data;
  }

  Future<List<T>> postList<T>({
    required String endpoint,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );

    if (response.data == null &&
        response.statusCode != 204 &&
        response.statusCode != 200) {
      throw CustomException(message: "Response data is null");
    }
    if (response.data == null) {
      return [];
    }
    List<T> result = List<T>.from(response.data);
    return result;
  }

  Future<JSON> put({
    required String endpoint,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.put<JSON>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    // Status code 204 = success but returns null response
    if (response.data == null &&
        response.statusCode != 204 &&
        response.statusCode != 200) {
      throw CustomException(message: "Response data is null");
    }
    return response.data ?? {};
  }

  /// This method sends a `PATCH` request to the [endpoint], **decodes**
  /// the response and returns a parsed [ResponseModel] with a body of type [R].
  ///
  /// Any errors encountered during the request are caught and a custom
  /// [CustomException] is thrown.
  ///
  /// The [data] contains body for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [options] are special instructions that can be merged with the request.
  Future<JSON> patch<R>({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.patch<JSON>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data ?? {};
  }

  /// This method sends a `DELETE` request to the [endpoint], **decodes**
  /// the response and returns a parsed [ResponseModel] with a body of type [R].
  ///
  /// Any errors encountered during the request are caught and a custom
  /// [CustomException] is thrown.
  ///
  /// The [data] contains body for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [options] are special instructions that can be merged with the request.
  Future<JSON> delete<R>({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.delete<JSON>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data ?? {};
  }

  Future<Response> download(
    String urlPath,
    dynamic savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) async {
    return await _dio.download(urlPath, savePath,
        options: Options(responseType: ResponseType.bytes));
  }

  // /// A utility method to merge [globalCacheOptions] and request
  // /// supplied [CacheOptions].
  // ///
  // /// The request [CacheOptions] overrides the overlapping values in
  // /// [globalCacheOptions].
  // ///
  // /// Returns a merged [CacheOptions] object.
  // CacheOptions? _mergeGlobalAndRequestCacheOptions(
  //   CacheOptions? cacheOptions,
  // ) {
  //   return globalCacheOptions?.copyWith(
  //     policy: cacheOptions?.policy,
  //     keyBuilder: cacheOptions?.keyBuilder,
  //     priority: cacheOptions?.priority,
  //     store: cacheOptions?.store,
  //     allowPostMethod: cacheOptions?.allowPostMethod,
  //     hitCacheOnErrorExcept: (cacheOptions?.hitCacheOnErrorExcept) != null
  //         ? Nullable(cacheOptions!.hitCacheOnErrorExcept)
  //         : null,
  //     maxStale: (cacheOptions?.maxStale) != null
  //         ? Nullable(cacheOptions!.maxStale)
  //         : null,
  //     cipher: (cacheOptions?.cipher) != null
  //         ? Nullable(cacheOptions!.cipher)
  //         : null,
  //   );
  // }

  /// A utility method used to merge together [Options]
  /// and [CacheOptions].
  ///
  /// Returns an [Options] object with [CacheOptions] stored
  /// in the [options.extra] key.
  Options? _mergeDioAndCacheOptions({
    Options? dioOptions,
    CacheOptions? cacheOptions,
  }) {
    if (dioOptions == null && cacheOptions == null) {
      return null;
    } else if (dioOptions == null && cacheOptions != null) {
      return cacheOptions.toOptions();
    } else if (dioOptions != null && cacheOptions == null) {
      return dioOptions;
    }

    final cacheOptionsMap = cacheOptions!.toExtra();
    final options = dioOptions!.copyWith(
      extra: <String, dynamic>{...dioOptions.extra!, ...cacheOptionsMap},
    );
    return options;
  }
}
