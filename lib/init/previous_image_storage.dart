import 'package:photo_ai/packages/index.dart';

class PreviousImageStorage {
  static const storageKey = 'face2_ai_previously_saved_image';

  Future<bool> checkPreviousSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString(storageKey);
    if(imagePath == null || imagePath.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<String> getPreviousSavedImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString(storageKey);
    return imagePath!;
  }

  Future<void> savePreviousImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(storageKey, path);
  }
}