import 'dart:io';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorUtil{
  static final FaceDetectorOptions _options = FaceDetectorOptions();
  static final FaceDetector _faceDetector = FaceDetector(options: _options);

  static Future<bool> checkImagePathHasFace(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final List<Face> faces = await _faceDetector.processImage(inputImage);

    return faces.isNotEmpty;
  }

  static Future<bool> checkImageHasFace(File image) async {
    final inputImage = InputImage.fromFile(image);
    final List<Face> faces = await _faceDetector.processImage(inputImage);

    return faces.isNotEmpty;
  }
}