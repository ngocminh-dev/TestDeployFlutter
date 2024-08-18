import '../../../packages/lib_manager/lib_manager.dart';
import 'app_color.dart';

extension ContextTextStyle on BuildContext {
  TextStyle get heading1 => AppTextStyle.heading1;

  TextStyle get heading2 => AppTextStyle.heading2;

  TextStyle get heading3 => AppTextStyle.heading3;

  TextStyle get heading4 => AppTextStyle.heading4;

  TextStyle get heading5 => AppTextStyle.heading5;

  TextStyle get heading6 => AppTextStyle.heading6;

  TextStyle get heading7 => AppTextStyle.heading7;

  TextStyle get heading8 => AppTextStyle.heading8;

  TextStyle get heading9 => AppTextStyle.heading9;

  TextStyle get subtitle1 => AppTextStyle.subtitle1;

  TextStyle get subtitle2 => AppTextStyle.subtitle2;

  TextStyle get subtitle3 => AppTextStyle.subtitle3;

  TextStyle get subtitle4 => AppTextStyle.subtitle4;

  TextStyle get subtitle5 => AppTextStyle.subtitle5;

  TextStyle get body1 => AppTextStyle.body1;

  TextStyle get body2 => AppTextStyle.body2;

  TextStyle get body3 => AppTextStyle.body3;

  TextStyle get button1 => AppTextStyle.button1;

  TextStyle get button2 => AppTextStyle.button2;

  TextStyle get button3 => AppTextStyle.button3;

  TextStyle get button4 => AppTextStyle.button4;

  TextStyle get button5 => AppTextStyle.button5;

  TextStyle get button6 => AppTextStyle.button6;

  TextStyle get label1 => AppTextStyle.label1;

  TextStyle get label2 => AppTextStyle.label2;

  TextStyle get label3 => AppTextStyle.label3;

  TextStyle get label4 => AppTextStyle.label4;

  TextStyle get label5 => AppTextStyle.label5;

  TextStyle get label6 => AppTextStyle.label6;

  TextStyle get placeholder1 => AppTextStyle.placeholder1;

  TextStyle get placeholder2 => AppTextStyle.placeholder2;

  TextStyle get highlight1 => AppTextStyle.highlight1;

  TextStyle get highlight2 => AppTextStyle.highlight2;

  TextStyle get highlight3 => AppTextStyle.highlight3;

  TextStyle get highlight4 => AppTextStyle.highlight4;

  TextStyle get highlight5 => AppTextStyle.highlight5;

  TextStyle get highlight6 => AppTextStyle.highlight6;
}

class AppTextStyle extends TextStyle {
  const AppTextStyle._();

  static final _headingParent = GoogleFonts.inter(
    fontSize: 56,
    fontWeight: FontWeight.w600,
    height: 68 / 56,
    color: AppColor.textTitle,
  );

  static final _subtitleParent = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 26 / 18,
    color: AppColor.textTitle,
  );

  static final _bodyParent = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 28 / 18,
    color: AppColor.textTitle,
  );

  static final _buttonParent = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
    color: AppColor.textTitle,
  );

  static final _labelParent = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    color: AppColor.textTitle,
  );

  static final _placeholderParent = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 28 / 16,
    color: AppColor.textTitle,
  );

  static final _highlightParent = GoogleFonts.inter(
    fontSize: 56,
    fontWeight: FontWeight.w500,
    height: 68 / 56,
    color: AppColor.textTitle,
  );

  static final heading1 = _headingParent;
  static final heading2 = _headingParent.copyWith(
    fontSize: 46,
    height: 56 / 46,
  );
  static final heading3 = _headingParent.copyWith(
    fontSize: 38,
    height: 46 / 38,
  );
  static final heading4 = _headingParent.copyWith(
    fontSize: 30,
    height: 38 / 30,
  );
  static final heading5 = _headingParent.copyWith(
    fontSize: 24,
    height: 32 / 24,
  );
  static final heading6 = _headingParent.copyWith(
    fontSize: 20,
    height: 28 / 20,
  );
  static final heading7 = _headingParent.copyWith(
    fontSize: 16,
    height: 24 / 16,
  );
  static final heading8 = _headingParent.copyWith(
    fontSize: 14,
    height: 22 / 14,
  );
  static final heading9 = _headingParent.copyWith(
    fontSize: 12,
    height: 20 / 12,
  );

  static final subtitle1 = _subtitleParent;
  static final subtitle2 = _subtitleParent.copyWith(
    fontSize: 16,
    height: 24 / 16,
  );
  static final subtitle3 = _subtitleParent.copyWith(
    fontSize: 14,
    height: 22 / 14,
  );
  static final subtitle4 = _subtitleParent.copyWith(
    fontSize: 12,
    height: 16 / 12,
  );
  static final subtitle5 = _subtitleParent.copyWith(
    fontSize: 10,
    height: 14 / 10,
  );

  static final body1 = _bodyParent;
  static final body2 = _bodyParent.copyWith(fontSize: 16, height: 24 / 16);
  static final body3 = _bodyParent.copyWith(fontSize: 14, height: 22 / 14);

  static final button1 = _buttonParent;
  static final button2 = _buttonParent.copyWith(fontWeight: FontWeight.w500);
  static final button3 = _buttonParent.copyWith(
    fontSize: 14,
    height: 22 / 14,
    fontWeight: FontWeight.w500,
  );
  static final button4 = _buttonParent.copyWith(
    fontSize: 14,
    height: 22 / 14,
    fontWeight: FontWeight.w400,
  );
  static final button5 = _buttonParent.copyWith(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
  );
  static final button6 = _buttonParent.copyWith(
    fontSize: 12,
    height: 26 / 12,
    fontWeight: FontWeight.w400,
  );

  static final label1 = _labelParent;
  static final label2 = _labelParent.copyWith(
    height: 22 / 16,
    fontWeight: FontWeight.w400,
  );
  static final label3 = _labelParent.copyWith(fontSize: 14, height: 22 / 14);
  static final label4 = _labelParent.copyWith(
    fontSize: 14,
    height: 22 / 14,
    fontWeight: FontWeight.w400,
  );
  static final label5 = _labelParent.copyWith(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
  );
  static final label6 = _labelParent.copyWith(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
  );

  static final placeholder1 = _placeholderParent;
  static final placeholder2 = _placeholderParent.copyWith(
    fontSize: 14,
    height: 22 / 14,
  );

  static final highlight1 = _highlightParent;
  static final highlight2 = _highlightParent.copyWith(
    fontSize: 46,
    height: 56 / 46,
  );
  static final highlight3 = _highlightParent.copyWith(
    fontSize: 38,
    height: 46 / 38,
  );
  static final highlight4 = _highlightParent.copyWith(
    fontSize: 30,
    height: 38 / 30,
  );
  static final highlight5 = _highlightParent.copyWith(
    fontSize: 24,
    height: 32 / 24,
  );
  static final highlight6 = _highlightParent.copyWith(
    fontSize: 20,
    height: 28 / 20,
  );

  static final textTheme = TextTheme(
    displayLarge: highlight1,
    displayMedium: highlight2,
    displaySmall: highlight3,
    headlineLarge: heading1,
    headlineMedium: heading2,
    headlineSmall: heading3,
    titleLarge: subtitle1,
    titleMedium: subtitle2,
    titleSmall: subtitle3,
    bodyLarge: body1,
    bodyMedium: body2,
    bodySmall: body3,
    labelLarge: label1,
    labelMedium: label2,
    labelSmall: label3,
  );

  static const textHeightBehavior = TextHeightBehavior(
    leadingDistribution: TextLeadingDistribution.even,
    applyHeightToLastDescent: false,
    applyHeightToFirstAscent: false,
  );
}
