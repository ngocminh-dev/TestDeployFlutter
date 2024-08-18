import 'package:photo_ai/packages/index.dart';

class YDBulletList extends StatelessWidget {
  final List<String> strings;
  final TextStyle? style;

  const YDBulletList(this.strings, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: strings.map((str) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 2.5),
              child: AppText('\u2022'),
            ),
            context.width6X,
            Expanded(
              child: Text(
                str,
                textAlign: TextAlign.left,
                softWrap: true,
                style: style ?? context.body3,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
