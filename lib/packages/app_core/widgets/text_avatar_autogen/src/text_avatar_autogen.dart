import 'package:flutter/material.dart';

import 'enum.dart';
import 'text_avatar_autogen_impl.dart';

abstract class TextAvatarAutogen {
  /// Returns initial letters of the given [text] on a linear background gradient.
  /// Returns only the background if the [text] is empty.
  Widget textOnLinearGradient(
      {AvatarShape shape = AvatarShape.circle,
      required List<Color> colors,
      required String text,
      TextStyle? textStyle});

  static TextAvatarAutogen get I => TextAvatarAutogenImpl();
}
