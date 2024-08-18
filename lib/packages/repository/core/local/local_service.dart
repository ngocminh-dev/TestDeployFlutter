import 'dart:convert';

import '../../../index.dart';

class LocalService {
  static const String _keyLanguage = 'key_language';

  final List<String> keyExcludes = [];

  final SharedPreferences sharedPreferences;

  // late final StreamingSharedPreferences preferences;

  LocalService({required this.sharedPreferences}) {
    /* _initStreamingSharedPreferences();

    if (!keyExcludes.contains(kKeyStores)) {
      keyExcludes.add(kKeyStores);
    }
    if (!keyExcludes.contains(_keyFilter)) {
      keyExcludes.add(_keyFilter);
    }
    if (!keyExcludes.contains(kKeyPushNotificationStore)) {
      keyExcludes.add(kKeyPushNotificationStore);
    }*/
  }

  /*_initStreamingSharedPreferences() async {
    preferences = await StreamingSharedPreferences.instance;
  }
*/
  /*bool isAuthorized() {
    return sharedPreferences.containsKey(kKeyUid);
  }*/

  Future<dynamic> _getValueByKey(String key) async {
    if (sharedPreferences.containsKey(key)) {
      return sharedPreferences.get(key);
    }
    return null;
  }

  Future<void> _setValueByKey(String key, dynamic value) async {
    if (value == null) {
      await sharedPreferences.remove(key);
      return;
    }
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else {
      await sharedPreferences.setString(key, jsonEncode(value));
    }
  }

  Future<String> getLanguage() async {
    var language = await _getValueByKey(_keyLanguage) as String?;
    return language ?? 'en';
  }

  Future<void> saveLanguage({String? value}) async {
    await _setValueByKey(_keyLanguage, value);
  }
}
