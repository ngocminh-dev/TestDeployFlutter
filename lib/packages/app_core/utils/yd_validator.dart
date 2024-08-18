
import 'yd_utils.dart';

/// Contains validators and returns error text with localization.
class YDValidator {
  const YDValidator._();

  /// Returns the error text when input is not valid.
  /// Otherwise, returns null.
  ///
  /*static String? newPhone(String? phone, BuildContext context) {
    if (phone == null || phone.isEmpty) {
      return AppLocale.of(context).validator_please_input_new_phone_number;
    }
    if (phone.length < 10) {
      return AppLocale.of(context).validator_phone_at_least_10_digits;
    }
    if (!YDUtils.containsNumberOnly(phone)) {
      return AppLocale.of(context).validator_value_not_correct_format(
          AppLocale.of(context).common_phone_number);
    }
    if (!YDUtils.containsVietnamesePhoneNumber(phone)) {
      return AppLocale.of(context).validator_value_not_correct_format(
          AppLocale.of(context).common_phone_number);
    }
    return null;
  }

  /// Returns the error text when input is not valid.
  /// Otherwise, returns null.
  static String? phone(String? phone, BuildContext context) {
    String phoneNumberTitle = AppLocale.of(context).common_phone_number;
    if (phone == null || phone.isEmpty) {
      return AppLocale.of(context).validator_please_input_phone_number;
    }
    if (phone.length < 10) {
      return AppLocale.of(context).validator_phone_at_least_10_digits;
    }
    if (!YDUtils.containsNumberOnly(phone)) {
      return AppLocale.of(context)
          .validator_value_not_correct_format(phoneNumberTitle);
    }
    if (!YDUtils.containsVietnamesePhoneNumber(phone)) {
      return AppLocale.of(context)
          .validator_value_not_correct_format(phoneNumberTitle);
    }
    return null;
  }

  /// Returns the error text when input is not valid.
  /// Otherwise, returns null.
  static String? emptyOrEmail(String? email, BuildContext context) {
    if (email == null || email.trim().isEmpty == true) {
      return null;
    }
    String emailLocale = AppLocale.of(context).common_email;
    if (!YDUtils.validateEmailOrEmpty(email.toLowerCase())) {
      return AppLocale.of(context).validator_value_is_not_invalid(emailLocale);
    }
    return null;
  }

  /// Returns the error text when input is not valid.
  /// Otherwise, returns null.
  static String? email(String? email, BuildContext context) {
    String emailLocale = AppLocale.of(context).common_email;
    if (email == null || email.isEmpty) {
      return AppLocale.of(context)
          .validator_please_input_value(emailLocale.toLowerCase());
    }
    if (!YDUtils.validateEmail(email)) {
      return AppLocale.of(context).validator_value_is_not_invalid(emailLocale);
    }
    return null;
  }

  /// Returns the error text when input is not valid.
  /// Otherwise, returns null.
  static String? pwd(String? pwd, BuildContext context) {
    if (!YDUtils.atLeast8CharsWith1Upper1Number1SpecialChar(pwd ?? "")) {
      return AppLocale.of(context).validator_value_not_correct_format(
          AppLocale.of(context).common_password);
    }
    return null;
  }

  /// Returns the error text when input is not valid.
  /// Otherwise, returns null.
  static String? fullName(String? fullName, BuildContext context) {
    String firstNameLastNameLocale =
        AppLocale.of(context).common_first_name_last_name;

    // Trim the fullName as we do not allow only white space.
    if (fullName == null || fullName.trim().isEmpty) {
      return AppLocale.of(context)
          .validator_value_not_correct_format(firstNameLastNameLocale);
    }
    final stringInVietnamese = TiengViet.parse(fullName);
    if (!YDUtils.containsTextOnly(stringInVietnamese)) {
      return AppLocale.of(context)
          .validator_value_not_correct_format(firstNameLastNameLocale);
    }
    return null;
  }

  /// Returns the error text when input is not valid.
  /// Otherwise, returns null.
  static String? name(String? name, BuildContext context) {
    String nameLocale = AppLocale.of(context).common_name;

    // Trim the fullName as we do not allow only white space.
    if (name == null || name.trim().isEmpty) {
      return AppLocale.of(context)
          .validator_value_not_correct_format(nameLocale);
    }
    final stringInVietnamese = TiengViet.parse(name);
    if (!YDUtils.containsTextOnly(stringInVietnamese)) {
      return AppLocale.of(context)
          .validator_value_not_correct_format(nameLocale);
    }
    return null;
  }

  static String? onlyEmptyName(String? name, BuildContext context) {
    String nameLocale = AppLocale.of(context).common_name;

    // Trim the fullName as we do not allow only white space.
    if (name == null || name.trim().isEmpty) {
      return AppLocale.of(context).common_validate_empty_value(nameLocale);
    }
    return null;
  }

  /// Returns the error text when input is not valid.
  /// Otherwise, returns null.
  static String? username(String? username, BuildContext context) {
    if (username == null) {
      return AppLocale.of(context).validator_please_input_username;
    }
    if (username.length < 3) {
      return AppLocale.of(context).validator_value_not_correct_format(
          AppLocale.of(context).common_username);
    }
    if (!YDUtils.containsTextNumberAndUnderscore(username)) {
      return AppLocale.of(context).validator_value_not_correct_format(
          AppLocale.of(context).common_username);
    }
    return null;
  }*/
}
