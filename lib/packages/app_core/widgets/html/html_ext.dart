import '../../../index.dart';

extension HtmlExt on Style {
  static Style createStyleFromTextStyle(TextStyle textStyle) {
    return Style(
      padding: HtmlPaddings.zero,
      margin: Margins.zero,
      backgroundColor: textStyle.backgroundColor,
      color: textStyle.color,
      textDecoration: textStyle.decoration,
      textDecorationColor: textStyle.decorationColor,
      textDecorationStyle: textStyle.decorationStyle,
      textDecorationThickness: textStyle.decorationThickness,
      fontFamily: textStyle.fontFamily,
      fontFamilyFallback: textStyle.fontFamilyFallback,
      fontFeatureSettings: textStyle.fontFeatures,
      fontSize:
          textStyle.fontSize != null ? FontSize(textStyle.fontSize!) : null,
      fontStyle: textStyle.fontStyle,
      fontWeight: textStyle.fontWeight,
      letterSpacing: textStyle.letterSpacing,
      textShadow: textStyle.shadows,
      wordSpacing: textStyle.wordSpacing,
      lineHeight: LineHeight(textStyle.height ?? 1.2),
    );
  }
}
