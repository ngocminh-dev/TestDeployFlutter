import 'dart:async';

import 'package:flutter/cupertino.dart';

///
///
///    AppEvent.instance().post({AppEvent.pageIndex: 0});
///    AppEvent.instance().subscribe<bool>(AppEvent.logged, (value) {
///   listener(value);
///   });
///
abstract class AppEvent {
  static const String totalCart = 'total_cart';
  static const String logged = "logged";
  static const String customerRank = 'customerRank';
  static const String deeplinkUri = 'deeplinkUri';
  static const String homeIndex = 'homeIndex';

  static AppEvent instance() {
    return AppEventImpl();
  }

  void post(Map<String, dynamic> value);

  void subscribe<T>(
    String key,
    ValueChanged<T> listener, {
    bool listenerOldData,
  });

  void dispose();
}

class AppEventImpl extends AppEvent {
  final StreamController<Map<String, dynamic>> _controller;
  final Map<String, dynamic> _value = {};

  AppEventImpl({bool sync = false})
      : _controller = StreamController.broadcast(sync: sync);

  @override
  void post(Map<String, dynamic> value) {
    _controller.add(value);
    for (var key in value.keys) {
      _value[key] = value[key];
    }
  }

  @override
  void dispose() {
    _controller.close();
  }

  @override
  void subscribe<T>(
    String key,
    ValueChanged<T> listener, {
    bool listenerOldData = true,
  }) {
    if (_value.containsKey(key) && listenerOldData) {
      listener(_value[key]);
    }
    _controller.stream.listen((event) {
      if (!event.containsKey(key)) {
        return;
      }
      final value = event[key];
      if (value is T) {
        listener(value);
      }
    });
  }
}
