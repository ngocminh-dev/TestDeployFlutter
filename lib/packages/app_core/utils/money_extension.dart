import '../../index.dart';

extension Money on int {
  String get toMoney {
    final NumberFormat format = NumberFormat.currency(locale: 'vi', symbol: '');
    String result = format.format(this);
    return '${result.trim()} đ';
  }

  String toPhone() {
    final NumberFormat format = NumberFormat("###,###,###");
    String result = format.format(this);
    return result.trim().replaceAll(',', '.');
  }
}

extension MoneyExt on double {
  String get toMoney {
    final NumberFormat format = NumberFormat.currency(locale: 'vi', symbol: '');
    String result = format.format(toInt());
    return '${result.trim()} đ';
  }
}
