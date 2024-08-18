/*class DateUtils {
  DateUtils._();

  static const String formatHHmmddMMyyyy = "HH:mm dd/MM/yyyy";
  static const String formatddMMyyyy = "dd/MM/yyyy";
  static const String format = "yyyy-MM-dd'T'HH:mm:ss'Z'";

  /// format String date from "yyyy-MM-dd'T'HH:mm:ss'Z'" to "dd-MM-yyyy"
  *//*static String formatDate(String date, {String format = formatddMMyyyy}) {
    DateFormat formatter = DateFormat(format);
    DateFormat? dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    try {
      dateFormat.parse(date, true);
    } catch (e) {
      dev.log(e.toString());
      return "";
    }
    return formatter.format(dateFormat.parse(date, true).toLocal());
  }*//*
}*/
