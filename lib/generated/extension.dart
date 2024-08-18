import 'package:flutter/material.dart';

import 'l10n.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocale get loc => AppLocale.of(this);
}
