import '../../packages/index.dart';
import 'photos.dart';

class PhotosImpl implements Photos {
  const PhotosImpl();

  @override
  Future<XFile?> pickImage({
    required ImageSource source,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool requestFullMetadata = true,
  }) async {
    final picker = ImagePicker();
    return await picker.pickImage(source: source);
  }

  @override
  Future<List<XFile>> pickMultiImage({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool requestFullMetadata = true,
  }) async {
    final picker = ImagePicker();
    return await picker.pickMultiImage(
        requestFullMetadata: requestFullMetadata);
  }

  @override
  Future<XFile?> takeImage({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    bool requestFullMetadata = true,
  }) async {
    final picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.camera);
  }

  @override
  Future<bool> requestPhotosPermission({
    ListenerBoolean? photosDeniedForeverRequestDialog,
  }) async {
    if (Platform.isAndroid) {
      final androidCheck = await _isBelowAndroid13();
      if (androidCheck) return true;
    }
    final status = await Permission.photos.request();
    if (status.isGranted || status.isLimited) return true;
    if (photosDeniedForeverRequestDialog == null) return false;
    bool goToSettings = await photosDeniedForeverRequestDialog();
    if (!goToSettings) return false;
    openAppSettings();
    return false;
  }

  Future<bool> _isBelowAndroid13() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    return androidInfo.version.sdkInt < 33;
  }

  @override
  Future<bool> requestCameraPermission({
    ListenerBoolean? cameraDeniedForeverRequestDialog,
  }) async {
    final status = await Permission.camera.request();
    if (status.isGranted || status.isLimited) return true;
    if (cameraDeniedForeverRequestDialog == null) return false;
    bool goToSettings = await cameraDeniedForeverRequestDialog();
    if (!goToSettings) return false;
    openAppSettings();
    return false;
  }
}
