import 'package:photo_ai/generated/index.dart';

import '../../../../generated/assets.dart';
import '../../../index.dart';

class RequestPermissionDialog extends StatelessWidget {
  final String? message;
  final String? stepContent;
  final GestureTapCallback? onAcceptRequestLocationPermission;
  final String? acceptButtonLabel;
  final String? cancelButtonLabel;
  final String? image;

  const RequestPermissionDialog({
    super.key,
    this.message,
    this.stepContent,
    this.onAcceptRequestLocationPermission,
    this.acceptButtonLabel,
    this.cancelButtonLabel,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: context.borderSmall),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.padding16X,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.color.white,
          borderRadius: context.borderSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                YdInkWell(
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const AppImage(
                    asset: Assets.outlineExit,
                    width: 44,
                    height: 44,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
            AppImage(asset: image ?? Assets.imgLaunch),
            context.height40X,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.padding40X),
              child: AppText(
                message ?? context.loc.permission_photos_message,
                style: context.subtitle3.copyWith(
                  color: context.color.textBody,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            if (stepContent != null)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.padding32X,
                ),
                child: Html(
                  data: stepContent!.trim(),
                  style: {
                    'p': HtmlExt.createStyleFromTextStyle(
                      context.subtitle3.copyWith(
                        color: context.color.textBody,
                      ),
                    ),
                    'b': HtmlExt.createStyleFromTextStyle(
                      context.label3.copyWith(
                        color: context.color.textLabel,
                      ),
                    ),
                  },
                ),
              ),
            Container(
              padding: EdgeInsets.only(
                top: context.padding24X,
                bottom: context.padding36X,
                left: context.padding24X,
                right: context.padding24X,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: context.width,
                    height: 48,
                    child: AppFilledButton(
                      child: AppText(
                        acceptButtonLabel ?? context.loc.common_allow,
                        style: context.button1.copyWith(
                          color: context.color.white,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ),
                  context.height16X,
                  SizedBox(
                    width: context.width,
                    height: 48,
                    child: YDOutlinedButton(
                      label: AppText(
                        cancelButtonLabel ?? context.loc.common_un_allow,
                        style: context.button1,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      buttonStyle: YDButtonStyle.defaultOutlinedStyle.copyWith(
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
