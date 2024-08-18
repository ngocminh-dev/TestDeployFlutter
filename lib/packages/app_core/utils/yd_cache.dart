import 'package:flutter/material.dart';

import '../index.dart';

class YDCache {
  const YDCache();

  static double _screenWidth = 0;

  static double get screenWidth => _screenWidth;

  static double _screenHeight = 0;

  static double get screenHeight => _screenHeight;

  static double _topViewPadding = 0;

  static double get topViewPadding => _topViewPadding;

  static double _bottomViewPadding = 0;

  static double get bottomViewPadding => _bottomViewPadding;

  static double _topViewInsets = 0;

  static double get topViewInsets => _topViewInsets;

  static double _bottomViewInsets = 0;

  static double get bottomViewInsets => _bottomViewInsets;

  static double _devicePixelRatio = 0;

  static double get devicePixelRatio => _devicePixelRatio;

  static Orientation _orientation = Orientation.portrait;

  static Orientation get orientation => _orientation;

  static bool passedOnboarding = false;
  static int limit = 30;
  static int smallLimit = 10;

  static String? fcmToken;

  static double _productImageRatio = 1;

  static double get productImageRatio => _productImageRatio;
  static double _productCartRatio = 1;

  static double get productCartRatio => _productCartRatio;

  static void getScreenSize(BuildContext context) {
    _screenWidth = MediaQuery.sizeOf(context).width;
    _screenHeight = MediaQuery.sizeOf(context).height;
    _topViewPadding = MediaQuery.viewPaddingOf(context).top;
    _bottomViewPadding = MediaQuery.viewPaddingOf(context).bottom;
    _topViewInsets = MediaQuery.viewInsetsOf(context).top;
    _bottomViewInsets = MediaQuery.viewInsetsOf(context).bottom;
    _orientation = MediaQuery.orientationOf(context);
    _devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

    _productImageRatio = _screenWidth / 428 * YDSpacing.productImageRatio;
    _productCartRatio = _screenWidth / 428 * YDSpacing.productRatio;
  }

  static const double endReachedThreshold = 100;
}
