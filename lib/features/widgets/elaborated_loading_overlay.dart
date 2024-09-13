import 'package:flutter/material.dart';

import 'loading_page.dart';

class ElaboratedLoadingOverlay {
  final String url;
  final String text;
  late final OverlayEntry _loadingOverlayEntry;

  ElaboratedLoadingOverlay({required this.url, this.text = ""}) {
    _init();
  }

  void _init() {
    _loadingOverlayEntry = OverlayEntry(
      builder: (context) =>
          AnimationLoading(
            urlFromAssets: url,
            text: text,
          ),
    );
  }

  void showLoadingOverlay(BuildContext context) {
    Overlay.of(context).insert(_loadingOverlayEntry);
  }

  void removeLoadingOverlay() {
    _loadingOverlayEntry.remove();
  }
}