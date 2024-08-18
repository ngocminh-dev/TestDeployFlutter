import '../../index.dart';

class AppRoundedButton extends StatelessWidget {
  const AppRoundedButton({super.key, required this.icon, required this.label, this.onClick, this.color, this.bottomPadding});

  final VoidCallback? onClick;
  final Widget icon;
  final Color? color;
  final String label;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: onClick,
            icon: icon,
          style: IconButton.styleFrom(
            shape: const CircleBorder(),
            padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: bottomPadding ?? 5),
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
      ],
    );
  }
}
