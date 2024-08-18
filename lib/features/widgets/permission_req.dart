import 'package:photo_ai/features/access_photo/photo_gallery/photo_gallery_page.dart';
import 'package:photo_ai/generated/extension.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../generated/assets.dart';
import '../../packages/index.dart';
import '../../utils/photos/photos.dart';
import 'image_resize_util.dart';

class PermissionReq {
  static Future<void> requestPhotoPermission(BuildContext context,
      void Function({required String pathFile}) navigateFunction,
      {bool? temporaryImage}) async {
    bool hasPermission = await Photos.instance.requestPhotosPermission(
      photosDeniedForeverRequestDialog: () async {
        return await _showRequestDialog(
          context,
          image: Assets.imgRequestPhotosCamera,
          message: context.loc.permission_photos_message,
          stepContent: (Platform.isAndroid)
              ? context.loc.permission_photos_steps_android
              : context.loc.permission_photos_steps_ios,
        );
      },
    );
    if (!hasPermission) return;

    final PermissionState ps = await PhotoManager.requestPermissionExtend();

    if (context.mounted && (ps.isAuth || ps.hasAccess)) {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PhotoGallery(
                    navigateFunction: navigateFunction,
                    temporaryImage: temporaryImage,
                  )));
    }

    return;
  }

  static Future<void> requestCameraPermission(BuildContext context,
      void Function({required String pathFile}) navigateFunction) async {
    bool hasPermission = await Photos.instance.requestCameraPermission(
      cameraDeniedForeverRequestDialog: () async {
        return await _showRequestDialog(
          context,
          image: Assets.imgRequestPhotosCamera,
          message: context.loc.permission_camera_message,
          stepContent: Platform.isAndroid
              ? context.loc.permission_camera_steps_android
              : context.loc.permission_camera_steps_ios,
        );
      },
    );
    if (!hasPermission) {
      return;
    }

    final file = await Photos.instance.takeImage();

    if (file == null || !context.mounted) {
      return;
    }

    await ImageResizeUtil.resizeAndSaveImage(file);

    navigateFunction(pathFile: file.path);
  }

  static Future<bool> _showRequestDialog(
    BuildContext context, {
    String? message,
    String? acceptButtonLabel,
    String? cancelButtonLabel,
    String? stepContent,
    String? image,
  }) async {
    return await showDialog<bool>(
          context: context,
          useSafeArea: false, // user must tap button!
          barrierDismissible: false,
          builder: (BuildContext context) {
            return RequestPermissionDialog(
              message: message,
              image: image,
              stepContent: stepContent,
              acceptButtonLabel: acceptButtonLabel,
              cancelButtonLabel: cancelButtonLabel,
            );
          },
        ) ??
        false;
  }
}
