import '../../../index.dart';

class Local {
  final SharedPreferences _sharedPreferences = GetIt.instance.get();
  late final LocalService _localService;

  static final Local instance = Local._();

  Local._() {
    _localService = LocalService(sharedPreferences: _sharedPreferences);
  }

  LocalService get localService {
    return _localService;
  }
}
