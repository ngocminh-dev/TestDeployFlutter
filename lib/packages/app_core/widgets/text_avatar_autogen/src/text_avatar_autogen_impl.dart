import 'package:flutter/material.dart';
import 'enum.dart';
import 'text_avatar_autogen.dart';

class TextAvatarAutogenImpl implements TextAvatarAutogen {
  @override
  Widget textOnLinearGradient(
      {AvatarShape shape = AvatarShape.circle,
      required List<Color> colors,
      required String text,
      TextStyle? textStyle}) {
    return _createCircleAvatar(
        BackgroundColorType.linear, colors, text, textStyle);
  }

  Widget _createCircleAvatar(BackgroundColorType type, List<Color> colors,
      String text, TextStyle? textStyle) {
    Gradient? gradient;
    Color? color;

    switch (type) {
      case BackgroundColorType.linear:
        gradient = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colors,
            tileMode: TileMode.clamp);
        break;
      case BackgroundColorType.solid:
        color = colors.first;
        break;
    }

    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradient,
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(_getInitials(text).toUpperCase(),
            style: textStyle ??
                const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    height: 46 / 38,
                    color: Colors.white)));
  }

  String _getInitials(String name) {
    // Trims
    String processedString = name.trim();

    if (processedString.isEmpty) return processedString;

    // Returns the name if there's only 1 letter
    if (processedString.length == 1) return processedString;

    // If the name only has 1 word (no space), gets the first and the last letters
    if (!processedString.contains(" ")) {
      return "${processedString[0]}${processedString[processedString.length - 1]}";
    }

    // If the name has more than 1 word, get first letter of each words
    var firstLettersOfEachWord =
        processedString.trim().split(RegExp(' +')).map((s) => s[0]).toList();

    // Get the first letter of the 2 last words
    final length = firstLettersOfEachWord.length;
    final firstLetter = firstLettersOfEachWord[length - 2];
    final secondLetter = firstLettersOfEachWord.last;
    processedString = "$firstLetter$secondLetter";
    return processedString;
  }
}
