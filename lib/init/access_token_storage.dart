import 'package:photo_ai/packages/index.dart';


class AccessTokenStorage {
  static const storageKey = 'face2_ai_access_token';
  final _storage = const FlutterSecureStorage();
  NetworkSrc networkSrc = NetworkSrc();
  late Repository _repository;

  AccessTokenStorage() {
    _repository = RepositoryImpl(ApiServiceImpl(networkSrc.dioService, networkSrc.downloadDioService, networkSrc.commonDioService));
  }

  IOSOptions _getIOSOptions() => const IOSOptions();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<String> getAccessToken() async {
    String? accessToken = await _storage.read(
        key: storageKey,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());

    if (accessToken == null || accessToken.isEmpty) {
      String newAccessToken = await _repository.createAnonymousUser();
      _storage.write(
          key: storageKey,
          value: newAccessToken,
          iOptions: _getIOSOptions(),
          aOptions: _getAndroidOptions());
      return newAccessToken;
    } else {
      return accessToken;
    }
  }
}
