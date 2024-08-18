import 'package:flutter/material.dart';

mixin MaterialColorMixin {
  static MaterialStateProperty<T> getMaterialProps<T>(
      {dynamic active, dynamic disabled, dynamic pressed, dynamic hovered}) {
    return MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return disabled;
      }
      if (states.contains(MaterialState.hovered)) {
        return hovered;
      }
      if (states.contains(MaterialState.pressed)) {
        return pressed;
      }
      return active;
    });
  }
}

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension(
    this.white,
    this.black,
    this.gray10,
    this.gray20,
    this.gray40,
    this.gray60,
    this.gray70,
    this.gray90,
    this.gray110,
    this.gray160,
    this.gradientStart1,
    this.gradientEnd1,
    this.gradientStart2,
    this.gradientEnd2,
    this.gradientStart3,
    this.gradientEnd3,
    this.gradientStart4,
    this.gradientEnd4,
    this.gradientStart5,
    this.gradientEnd5,
    this.gradientStart6,
    this.gradientEnd6, {
    required this.primary,
    required this.primarySub,
    required this.primaryHover,
    required this.primaryPressed,
    required this.primaryBackground,
    required this.primaryBorder,
    required this.secondary,
    required this.secondarySub,
    required this.secondaryHover,
    required this.secondaryPressed,
    required this.secondaryBackground,
    required this.secondaryBorder,
    required this.backgroundWhite,
    required this.backgroundLight1,
    required this.backgroundLight2,
    required this.backgroundLight3,
    required this.backgroundHover,
    required this.backgroundPressed,
    required this.backgroundSelected,
    required this.backgroundDisabled,
    required this.backgroundBlack,
    required this.textDisabled,
    required this.textPlaceholder,
    required this.textSubtitle,
    required this.textBody,
    required this.textLabel,
    required this.textTitle,
    required this.borderDivider,
    required this.borderBorder,
    required this.borderHoverActive,
    required this.alertInfo,
    required this.alertInfoSub,
    required this.alertInfoHover,
    required this.alertInfoPressed,
    required this.alertInfoBackground,
    required this.alertInfoBorder,
    required this.alertSuccess,
    required this.alertSuccessSub,
    required this.alertSuccessHover,
    required this.alertSuccessPressed,
    required this.alertSuccessBackground,
    required this.alertSuccessBorder,
    required this.alertWarning,
    required this.alertWarningSub,
    required this.alertWarningHover,
    required this.alertWarningPressed,
    required this.alertWarningBackground,
    required this.alertWarningBorder,
    required this.alertError,
    required this.alertErrorSub,
    required this.alertErrorHover,
    required this.alertErrorPressed,
    required this.alertErrorBackground,
    required this.alertErrorBorder,
    required this.colorShadow,
  });

  final Color primary;
  final Color primarySub;
  final Color primaryHover;
  final Color primaryPressed;
  final Color primaryBackground;
  final Color primaryBorder;

  final Color secondary;
  final Color secondarySub;
  final Color secondaryHover;
  final Color secondaryPressed;
  final Color secondaryBackground;
  final Color secondaryBorder;

  final Color backgroundWhite;
  final Color backgroundLight1;
  final Color backgroundLight2;
  final Color backgroundLight3;
  final Color backgroundHover;
  final Color backgroundPressed;
  final Color backgroundSelected;
  final Color backgroundDisabled;
  final Color backgroundBlack;

  final Color textDisabled;
  final Color textPlaceholder;
  final Color textSubtitle;
  final Color textBody;
  final Color textLabel;
  final Color textTitle;

  final Color borderDivider;
  final Color borderBorder;
  final Color borderHoverActive;

  final Color alertInfo;
  final Color alertInfoSub;
  final Color alertInfoHover;
  final Color alertInfoPressed;
  final Color alertInfoBackground;
  final Color alertInfoBorder;

  final Color alertSuccess;
  final Color alertSuccessSub;
  final Color alertSuccessHover;
  final Color alertSuccessPressed;
  final Color alertSuccessBackground;
  final Color alertSuccessBorder;

  final Color alertWarning;
  final Color alertWarningSub;
  final Color alertWarningHover;
  final Color alertWarningPressed;
  final Color alertWarningBackground;
  final Color alertWarningBorder;

  final Color alertError;
  final Color alertErrorSub;
  final Color alertErrorHover;
  final Color alertErrorPressed;
  final Color alertErrorBackground;
  final Color alertErrorBorder;

  final Color white;
  final Color black;

  final Color gray10;
  final Color gray20;
  final Color gray40;
  final Color gray60;
  final Color gray70;
  final Color gray90;
  final Color gray110;
  final Color gray160;

  final Color gradientStart1;
  final Color gradientEnd1;
  final Color gradientStart2;
  final Color gradientEnd2;
  final Color gradientStart3;
  final Color gradientEnd3;
  final Color gradientStart4;
  final Color gradientEnd4;
  final Color gradientStart5;
  final Color gradientEnd5;
  final Color gradientStart6;
  final Color gradientEnd6;
  final Color colorShadow;

  @override
  AppThemeExtension copyWith({
    Color? primary,
    Color? primarySub,
    Color? primaryHover,
    Color? primaryPressed,
    Color? primaryBackground,
    Color? primaryBorder,
    Color? secondary,
    Color? secondarySub,
    Color? secondaryHover,
    Color? secondaryPressed,
    Color? secondaryBackground,
    Color? secondaryBorder,
    Color? backgroundWhite,
    Color? backgroundLight1,
    Color? backgroundLight2,
    Color? backgroundLight3,
    Color? backgroundHover,
    Color? backgroundPressed,
    Color? backgroundSelected,
    Color? backgroundDisabled,
    Color? backgroundBlack,
    Color? textDisabled,
    Color? textPlaceholder,
    Color? textSubtitle,
    Color? textBody,
    Color? textLabel,
    Color? textTitle,
    Color? borderDivider,
    Color? borderBorder,
    Color? borderHoverActive,
    Color? alertInfo,
    Color? alertInfoSub,
    Color? alertInfoHover,
    Color? alertInfoPressed,
    Color? alertInfoBackground,
    Color? alertInfoBorder,
    Color? alertSuccess,
    Color? alertSuccessSub,
    Color? alertSuccessHover,
    Color? alertSuccessPressed,
    Color? alertSuccessBackground,
    Color? alertSuccessBorder,
    Color? alertWarning,
    Color? alertWarningSub,
    Color? alertWarningHover,
    Color? alertWarningPressed,
    Color? alertWarningBackground,
    Color? alertWarningBorder,
    Color? alertError,
    Color? alertErrorSub,
    Color? alertErrorHover,
    Color? alertErrorPressed,
    Color? alertErrorBackground,
    Color? alertErrorBorder,
    Color? colorShadow,
  }) {
    return AppThemeExtension(
      white,
      black,
      gray10,
      gray20,
      gray40,
      gray60,
      gray70,
      gray90,
      gray110,
      gray160,
      gradientStart1,
      gradientEnd1,
      gradientStart2,
      gradientEnd2,
      gradientStart3,
      gradientEnd3,
      gradientStart4,
      gradientEnd4,
      gradientStart5,
      gradientEnd5,
      gradientStart6,
      gradientEnd6,
      primary: primary ?? this.primary,
      primarySub: primarySub ?? this.primarySub,
      primaryHover: primaryHover ?? this.primaryHover,
      primaryPressed: primaryPressed ?? this.primaryPressed,
      primaryBackground: primaryBackground ?? this.primaryBackground,
      primaryBorder: primaryBorder ?? this.primaryBorder,
      secondary: secondary ?? this.secondary,
      secondarySub: secondarySub ?? this.secondarySub,
      secondaryHover: secondaryHover ?? this.secondaryHover,
      secondaryPressed: secondaryPressed ?? this.secondaryPressed,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      secondaryBorder: secondaryBorder ?? this.secondaryBorder,
      backgroundWhite: backgroundWhite ?? this.backgroundWhite,
      backgroundLight1: backgroundLight1 ?? this.backgroundLight1,
      backgroundLight2: backgroundLight2 ?? this.backgroundLight2,
      backgroundLight3: backgroundLight3 ?? this.backgroundLight3,
      backgroundHover: backgroundHover ?? this.backgroundHover,
      backgroundPressed: backgroundPressed ?? this.backgroundPressed,
      backgroundSelected: backgroundSelected ?? this.backgroundSelected,
      backgroundDisabled: backgroundDisabled ?? this.backgroundDisabled,
      backgroundBlack: backgroundBlack ?? this.backgroundBlack,
      textDisabled: textDisabled ?? this.textDisabled,
      textPlaceholder: textPlaceholder ?? this.textPlaceholder,
      textSubtitle: textSubtitle ?? this.textSubtitle,
      textBody: textBody ?? this.textBody,
      textLabel: textLabel ?? this.textLabel,
      textTitle: textTitle ?? this.textTitle,
      borderDivider: borderDivider ?? this.borderDivider,
      borderBorder: borderBorder ?? this.borderBorder,
      borderHoverActive: borderHoverActive ?? this.borderHoverActive,
      alertInfo: alertInfo ?? this.alertInfo,
      alertInfoSub: alertInfoSub ?? this.alertInfoSub,
      alertInfoHover: alertInfoHover ?? this.alertInfoHover,
      alertInfoPressed: alertInfoPressed ?? this.alertInfoPressed,
      alertInfoBackground: alertInfoBackground ?? this.alertInfoBackground,
      alertInfoBorder: alertInfoBorder ?? this.alertInfoBorder,
      alertSuccess: alertSuccess ?? this.alertSuccess,
      alertSuccessSub: alertSuccessSub ?? this.alertSuccessSub,
      alertSuccessHover: alertSuccessHover ?? this.alertSuccessHover,
      alertSuccessPressed: alertSuccessPressed ?? this.alertSuccessPressed,
      alertSuccessBackground:
          alertSuccessBackground ?? this.alertSuccessBackground,
      alertSuccessBorder: alertSuccessBorder ?? this.alertSuccessBorder,
      alertWarning: alertWarning ?? this.alertWarning,
      alertWarningSub: alertWarningSub ?? this.alertWarningSub,
      alertWarningHover: alertWarningHover ?? this.alertWarningHover,
      alertWarningPressed: alertWarningPressed ?? this.alertWarningPressed,
      alertWarningBackground:
          alertWarningBackground ?? this.alertWarningBackground,
      alertWarningBorder: alertWarningBorder ?? this.alertWarningBorder,
      alertError: alertError ?? this.alertError,
      alertErrorSub: alertErrorSub ?? this.alertErrorSub,
      alertErrorHover: alertErrorHover ?? this.alertErrorHover,
      alertErrorPressed: alertErrorPressed ?? this.alertErrorPressed,
      alertErrorBackground: alertErrorBackground ?? this.alertErrorBackground,
      alertErrorBorder: alertErrorBorder ?? this.alertErrorBorder,
      colorShadow: colorShadow ?? this.colorShadow,
    );
  }

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return AppThemeExtension(
      Color.lerp(white, other.white, t)!,
      Color.lerp(black, other.black, t)!,
      Color.lerp(gray10, other.gray10, t)!,
      Color.lerp(gray20, other.gray20, t)!,
      Color.lerp(gray40, other.gray40, t)!,
      Color.lerp(gray60, other.gray60, t)!,
      Color.lerp(gray70, other.gray70, t)!,
      Color.lerp(gray90, other.gray90, t)!,
      Color.lerp(gray110, other.gray110, t)!,
      Color.lerp(gray160, other.gray160, t)!,
      Color.lerp(gradientStart1, other.gradientStart1, t)!,
      Color.lerp(gradientEnd1, other.gradientEnd1, t)!,
      Color.lerp(gradientStart2, other.gradientStart2, t)!,
      Color.lerp(gradientEnd2, other.gradientEnd2, t)!,
      Color.lerp(gradientStart3, other.gradientStart3, t)!,
      Color.lerp(gradientEnd3, other.gradientEnd3, t)!,
      Color.lerp(gradientStart4, other.gradientStart4, t)!,
      Color.lerp(gradientEnd4, other.gradientEnd4, t)!,
      Color.lerp(gradientStart5, other.gradientStart5, t)!,
      Color.lerp(gradientEnd5, other.gradientEnd5, t)!,
      Color.lerp(gradientStart6, other.gradientStart6, t)!,
      Color.lerp(gradientEnd6, other.gradientEnd6, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primarySub: Color.lerp(primarySub, other.primarySub, t)!,
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t)!,
      primaryPressed: Color.lerp(primaryPressed, other.primaryPressed, t)!,
      primaryBackground:
          Color.lerp(primaryBackground, other.primaryBackground, t)!,
      primaryBorder: Color.lerp(primaryBorder, other.primaryBorder, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondarySub: Color.lerp(secondarySub, other.secondarySub, t)!,
      secondaryHover: Color.lerp(secondaryHover, other.secondaryHover, t)!,
      secondaryPressed:
          Color.lerp(secondaryPressed, other.secondaryPressed, t)!,
      secondaryBackground:
          Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
      secondaryBorder: Color.lerp(secondaryBorder, other.secondaryBorder, t)!,
      backgroundWhite: Color.lerp(backgroundWhite, other.backgroundWhite, t)!,
      backgroundLight1:
          Color.lerp(backgroundLight1, other.backgroundLight1, t)!,
      backgroundLight2:
          Color.lerp(backgroundLight2, other.backgroundLight2, t)!,
      backgroundLight3:
          Color.lerp(backgroundLight3, other.backgroundLight3, t)!,
      backgroundHover: Color.lerp(backgroundHover, other.backgroundHover, t)!,
      backgroundPressed:
          Color.lerp(backgroundPressed, other.backgroundPressed, t)!,
      backgroundSelected:
          Color.lerp(backgroundSelected, other.backgroundSelected, t)!,
      backgroundDisabled:
          Color.lerp(backgroundDisabled, other.backgroundDisabled, t)!,
      backgroundBlack: Color.lerp(backgroundBlack, other.backgroundBlack, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textPlaceholder: Color.lerp(textPlaceholder, other.textPlaceholder, t)!,
      textSubtitle: Color.lerp(textSubtitle, other.textSubtitle, t)!,
      textBody: Color.lerp(textBody, other.textBody, t)!,
      textLabel: Color.lerp(textLabel, other.textLabel, t)!,
      textTitle: Color.lerp(textTitle, other.textTitle, t)!,
      borderDivider: Color.lerp(borderDivider, other.borderDivider, t)!,
      borderBorder: Color.lerp(borderBorder, other.borderBorder, t)!,
      borderHoverActive:
          Color.lerp(borderHoverActive, other.borderHoverActive, t)!,
      alertInfo: Color.lerp(alertInfo, other.alertInfo, t)!,
      alertInfoSub: Color.lerp(alertInfoSub, other.alertInfoSub, t)!,
      alertInfoHover: Color.lerp(alertInfoHover, other.alertInfoHover, t)!,
      alertInfoPressed:
          Color.lerp(alertInfoPressed, other.alertInfoPressed, t)!,
      alertInfoBackground:
          Color.lerp(alertInfoBackground, other.alertInfoBackground, t)!,
      alertInfoBorder: Color.lerp(alertInfoBorder, other.alertInfoBorder, t)!,
      alertSuccess: Color.lerp(alertSuccess, other.alertSuccess, t)!,
      alertSuccessSub: Color.lerp(alertSuccessSub, other.alertSuccessSub, t)!,
      alertSuccessHover:
          Color.lerp(alertSuccessHover, other.alertSuccessHover, t)!,
      alertSuccessPressed:
          Color.lerp(alertSuccessPressed, other.alertSuccessPressed, t)!,
      alertSuccessBackground:
          Color.lerp(alertSuccessBackground, other.alertSuccessBackground, t)!,
      alertSuccessBorder:
          Color.lerp(alertSuccessBorder, other.alertSuccessBorder, t)!,
      alertWarning: Color.lerp(alertWarning, other.alertWarning, t)!,
      alertWarningSub: Color.lerp(alertWarningSub, other.alertWarningSub, t)!,
      alertWarningHover:
          Color.lerp(alertWarningHover, other.alertWarningHover, t)!,
      alertWarningPressed:
          Color.lerp(alertWarningPressed, other.alertWarningPressed, t)!,
      alertWarningBackground:
          Color.lerp(alertWarningBackground, other.alertWarningBackground, t)!,
      alertWarningBorder:
          Color.lerp(alertWarningBorder, other.alertWarningBorder, t)!,
      alertError: Color.lerp(alertError, other.alertError, t)!,
      alertErrorSub: Color.lerp(alertErrorSub, other.alertErrorSub, t)!,
      alertErrorHover: Color.lerp(alertErrorHover, other.alertErrorHover, t)!,
      alertErrorPressed:
          Color.lerp(alertErrorPressed, other.alertErrorPressed, t)!,
      alertErrorBackground:
          Color.lerp(alertErrorBackground, other.alertErrorBackground, t)!,
      alertErrorBorder:
          Color.lerp(alertErrorBorder, other.alertErrorBorder, t)!,
      colorShadow: Color.lerp(colorShadow, other.colorShadow, t)!,
    );
  }
}
