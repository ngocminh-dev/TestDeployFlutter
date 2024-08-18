import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_text_style.dart';
import 'app_themes_utils.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData getTheme({bool light = true}) {
    return light ? buildLightTheme() : buildDarkTheme();
  }

  static ThemeData buildLightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: AppColor.primary,
      colorScheme: lightColorScheme,
      canvasColor: Colors.transparent,
      extensions: <ThemeExtension>[lightThemeExtension],
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: Colors.transparent,
        modalBarrierColor: Colors.transparent,
      ),
      appBarTheme: AppBarTheme(
        color: AppColor.primary,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.textTitle, size: 24),
        titleTextStyle: AppTextStyle.heading6,
        scrolledUnderElevation: 2,
      ),
      textTheme: AppTextStyle.textTheme,
    );
  }

  static ThemeData buildDarkTheme() {
    return ThemeData.dark().copyWith(
      colorScheme: darkColorScheme,
      extensions: <ThemeExtension>[lightThemeExtension],
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      textTheme: AppTextStyle.textTheme,
    );
  }
}

extension ContextThemeExt on BuildContext {
  AppThemeExtension get color => Theme.of(this).extension<AppThemeExtension>()!;
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColor.primary,
  onPrimary: AppColor.primaryBackground,
  primaryContainer: AppColor.primarySub,
  onPrimaryContainer: AppColor.primaryBackground,
  secondary: AppColor.secondary,
  onSecondary: AppColor.secondaryBackground,
  secondaryContainer: AppColor.secondarySub,
  onSecondaryContainer: AppColor.secondaryBackground,
  tertiary: AppColor.primary,
  onTertiary: AppColor.primaryBackground,
  tertiaryContainer: AppColor.primarySub,
  onTertiaryContainer: AppColor.primaryBackground,
  error: AppColor.alertError,
  errorContainer: AppColor.alertErrorSub,
  onError: AppColor.alertErrorBackground,
  onErrorContainer: AppColor.alertErrorBackground,
  background: AppColor.backgroundWhite,
  onBackground: Color(0xFF001C38),
  surface: AppColor.backgroundLight1,
  onSurface: Color(0xFF001C38),
  surfaceVariant: Color(0xFFEFE0CF),
  onSurfaceVariant: Color(0xFF4F4539),
  outline: Color(0xFF817567),
  onInverseSurface: Color(0xFFEAF1FF),
  inverseSurface: Color(0xFF00315B),
  inversePrimary: Color(0xFFFFBA45),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF805600),
);

const lightThemeExtension = AppThemeExtension(
  AppColor.white,
  AppColor.black,
  AppColor.gray10,
  AppColor.gray20,
  AppColor.gray40,
  AppColor.gray60,
  AppColor.gray70,
  AppColor.gray90,
  AppColor.gray110,
  AppColor.gray160,
  AppColor.gradientStart1,
  AppColor.gradientEnd1,
  AppColor.gradientStart2,
  AppColor.gradientEnd2,
  AppColor.gradientStart3,
  AppColor.gradientEnd3,
  AppColor.gradientStart4,
  AppColor.gradientEnd4,
  AppColor.gradientStart5,
  AppColor.gradientEnd5,
  AppColor.gradientStart6,
  AppColor.gradientEnd6,
  primary: AppColor.primary,
  primarySub: AppColor.primarySub,
  primaryHover: AppColor.primaryHover,
  primaryPressed: AppColor.primaryPressed,
  primaryBackground: AppColor.primaryBackground,
  primaryBorder: AppColor.primaryBorder,
  secondary: AppColor.secondary,
  secondarySub: AppColor.secondarySub,
  secondaryHover: AppColor.secondaryHover,
  secondaryPressed: AppColor.secondaryPressed,
  secondaryBackground: AppColor.secondaryBackground,
  secondaryBorder: AppColor.secondaryBorder,
  backgroundWhite: AppColor.backgroundWhite,
  backgroundLight1: AppColor.backgroundLight1,
  backgroundLight2: AppColor.backgroundLight2,
  backgroundLight3: AppColor.backgroundLight3,
  backgroundHover: AppColor.backgroundHover,
  backgroundPressed: AppColor.backgroundPressed,
  backgroundSelected: AppColor.backgroundSelected,
  backgroundDisabled: AppColor.backgroundDisabled,
  backgroundBlack: AppColor.backgroundBlack,
  textDisabled: AppColor.textDisabled,
  textPlaceholder: AppColor.textPlaceholder,
  textSubtitle: AppColor.textSubtitle,
  textBody: AppColor.textBody,
  textLabel: AppColor.textLabel,
  textTitle: AppColor.textTitle,
  borderDivider: AppColor.borderDivider,
  borderBorder: AppColor.borderBorder,
  borderHoverActive: AppColor.borderHoverActive,
  alertInfo: AppColor.alertInfo,
  alertInfoSub: AppColor.alertInfoSub,
  alertInfoHover: AppColor.alertInfoHover,
  alertInfoPressed: AppColor.alertInfoPressed,
  alertInfoBackground: AppColor.alertInfoBackground,
  alertInfoBorder: AppColor.alertInfoBorder,
  alertSuccess: AppColor.alertSuccess,
  alertSuccessSub: AppColor.alertSuccessSub,
  alertSuccessHover: AppColor.alertSuccessHover,
  alertSuccessPressed: AppColor.alertSuccessPressed,
  alertSuccessBackground: AppColor.alertSuccessBackground,
  alertSuccessBorder: AppColor.alertSuccessBorder,
  alertWarning: AppColor.alertWarning,
  alertWarningSub: AppColor.alertWarningSub,
  alertWarningHover: AppColor.alertWarningHover,
  alertWarningPressed: AppColor.alertWarningPressed,
  alertWarningBackground: AppColor.alertWarningBackground,
  alertWarningBorder: AppColor.alertWarningBorder,
  alertError: AppColor.alertError,
  alertErrorSub: AppColor.alertErrorSub,
  alertErrorHover: AppColor.alertErrorHover,
  alertErrorPressed: AppColor.alertErrorPressed,
  alertErrorBackground: AppColor.alertErrorBackground,
  alertErrorBorder: AppColor.alertErrorBorder,
  colorShadow: AppColor.shadow,
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFBA45),
  onPrimary: Color(0xFF442C00),
  primaryContainer: Color(0xFF614000),
  onPrimaryContainer: Color(0xFFFFDDB0),
  secondary: Color(0xFFC1C1FF),
  onSecondary: Color(0xFF22227F),
  secondaryContainer: Color(0xFF3A3B96),
  onSecondaryContainer: Color(0xFFE1DFFF),
  tertiary: Color(0xFFA2C9FF),
  onTertiary: Color(0xFF00315B),
  tertiaryContainer: Color(0xFF004881),
  onTertiaryContainer: Color(0xFFD3E4FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF001C38),
  onBackground: Color(0xFFD3E4FF),
  surface: Color(0xFF001C38),
  onSurface: Color(0xFFD3E4FF),
  surfaceVariant: Color(0xFF4F4539),
  onSurfaceVariant: Color(0xFFD2C4B4),
  outline: Color(0xFF9B8F80),
  onInverseSurface: Color(0xFF001C38),
  inverseSurface: Color(0xFFD3E4FF),
  inversePrimary: Color(0xFF805600),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFBA45),
);
