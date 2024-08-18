import 'package:flutter/foundation.dart';
import 'package:photo_ai/features/click_management/click_management.dart';
import 'package:photo_ai/init/access_token_storage.dart';
import 'package:photo_ai/init/previous_image_storage.dart';

import 'firebase_options.dart';
import 'init/index.dart';
import 'packages/index.dart';

void main() async {
  await _initDependencies();
  runApp(const MainApplication());
}

Future<void> _initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Get secret key
  final result = await FirebaseFirestore.instance
      .collection('config')
      .doc('config-app')
      .get();

  final data = result.data() as Map<String, dynamic>;
  Config.secretKey = data['secret'];

  AccessTokenStorage accessTokenStorage = AccessTokenStorage();
  final accessToken = await accessTokenStorage.getAccessToken();
  Config.accessToken = accessToken;

  await _initDataSource();
  await _initUtilities();
  String? countryCode = await _initCountryCode();
  if(countryCode == null) {
    if(Platform.localeName == 'vi') {
      countryCode = 'VN';
    } else {
      countryCode = 'US';
    }
  }
  Config.countryCode = countryCode;
}

Future<void> _initDataSource() async {
  sl.registerLazySingleton<AppEvent>(() => AppEvent.instance());
  sl.registerSingleton(await SharedPreferences.getInstance());
  sl.registerSingleton<Local>(Repository.local);

  final Repository repository = await Repository.createRepository(
    appEvent: sl.get<AppEvent>(),
    local: sl.get<Local>(),
  );

  sl.registerSingleton<Repository>(repository);
}

Future<void> _initUtilities() async {
  final PreviousImageStorage imageStorage = PreviousImageStorage();
  final ClickManagement clickManagement = ClickManagement();

  sl.registerSingleton<PreviousImageStorage>(imageStorage);
  sl.registerSingleton<ClickManagement>(clickManagement);
}

Future<String?> _initCountryCode() async {
  final countryIpResponse = await CountryIp.find();
  return countryIpResponse?.countryCode;
}
