import 'dart:typed_data';

import '../../packages/index.dart';
import 'package:image/image.dart' as img;

class ImageResizeUtil {
  static Future<void> resizeAndSaveImage(XFile xFile) async {
    final File file = File(xFile.path);

    final Uint8List bytes = await file.readAsBytes();

    double scale = 1.0;

    final img.Image? image = img.decodeImage(bytes);
    int? maxValue = ((image?.width ?? 1) >= (image?.height ?? 1))
        ? image?.width
        : image?.height;
    if (maxValue! <= 720) {
      return;
    }
    scale = 720 / maxValue;
    if (scale > 1) {
      scale = 1;
    }
    if (image != null) {
      final img.Image resizedImage = img.copyResize(
        image,
        width: (image.width * scale).round(),
        height: (image.height * scale).round(),
      );

      final tempDir = await getTemporaryDirectory();
      final tempPath = tempDir.path;
      final tempFile = File('$tempPath/resized_image.jpg');
      await tempFile.writeAsBytes(img.encodeJpg(resizedImage));

      await tempFile.copy(file.path);
    } else {
      print('Failed to decode image');
    }
  }
}