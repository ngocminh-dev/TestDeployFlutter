import 'package:photo_ai/packages/index.dart';

class YDLoadingDialog extends StatelessWidget {
  const YDLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 86,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.color.backgroundBlack.withOpacity(0.6),
        borderRadius: context.borderMedium,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: context.color.white,
            ),
          ),
          context.height8X,
          AppText(
            "Đang tải",
            style: context.body3.copyWith(color: context.color.white),
          )
        ],
      ),
    );
  }
}
