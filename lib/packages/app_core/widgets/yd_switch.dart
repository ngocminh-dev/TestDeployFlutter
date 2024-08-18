import 'package:flutter/cupertino.dart';
import '../themes/index.dart';

class YDSwitch extends StatelessWidget {
  const YDSwitch({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: context.color.alertInfo,
      trackColor: context.color.gray60,
    );
  }
}
