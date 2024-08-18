
import '../../packages/index.dart';
import 'photos_impl.dart';

typedef ListenerBoolean = Future<bool> Function();

abstract class Photos {
  static Photos get instance => const PhotosImpl();

  Future<XFile?> pickImage({
    required ImageSource source,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool requestFullMetadata = true,
  });

  Future<XFile?> takeImage({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool requestFullMetadata = true,
  });

  Future<List<XFile>> pickMultiImage({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool requestFullMetadata = true,
  });

  Future<bool> requestPhotosPermission({
    ListenerBoolean? photosDeniedForeverRequestDialog,
  });

  Future<bool> requestCameraPermission({
    ListenerBoolean? cameraDeniedForeverRequestDialog,
  });
}
