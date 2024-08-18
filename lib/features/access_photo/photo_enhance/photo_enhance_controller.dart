import 'dart:typed_data';

import 'package:photo_ai/generated/extension.dart';

import '../../../init/sl.dart';
import '../../../packages/index.dart';
import '../../click_management/click_management.dart';
import '../../showToast/show_toast_controller.dart';
import '../../widgets/face_decector_util.dart';
import 'photo_enhance_state.dart';
import 'package:image/image.dart' as img;

class PhotoEnhanceController extends Cubit<PhotoEnhanceState> {
  final _repository = sl.get<Repository>();
  final _clickManager = sl.get<ClickManagement>();
  String? _urlFile;
  final String _pathFile;

  String get pathFile => _urlFile ?? _pathFile;

  PhotoEnhanceController(String filePath)
      : _pathFile = filePath,
        super(const PhotoEnhanceState(loading: false)) {
    _init();
  }

  void _init() async {
    _uploadFile();
    await getImageDimensions(_pathFile);
  }

  Future<void> checkHasFace(String filePath, BuildContext context) async {
    bool hasFace = await FaceDetectorUtil.checkImagePathHasFace(filePath);
    if(!hasFace && context.mounted) {
      ShowToastController.showToast(context, type: 'Warning',
          message: context.loc.no_face_warning);
    }

    emit(state.copyWith(
      hasFace: hasFace,
    ));
  }

  Future<void> getImageDimensions(String filePath) async {
    final File file = File(filePath);

    final Uint8List bytes = await file.readAsBytes();

    img.decodeImage(bytes);
  }

  void _uploadFile() async {
    if (_pathFile.isBlank) {
      return;
    }

    String fileName = _pathFile.split(Platform.pathSeparator).last;

    final storage = FirebaseStorage.instance
        .ref()
        .child('mobile-uploaded')
        .child('${Platform.pathSeparator}$fileName');

    try {
      await storage.putFile(File(_pathFile));
    } on FirebaseException {
      "";
    }

    _urlFile = await storage.getDownloadURL();
  }

  void generate(void Function(List<String> images) callback, {required bool isNormal}) async {
    if (_pathFile.isBlank) {
      callback([]);
      return;
    }
    if (_urlFile.isNotBlank) {
      final images = await _generate(isNormal: isNormal);
      callback(images);
      return;
    }
    Timer.periodic(100.milliseconds, (timer) async {
      if (!_urlFile.isBlank) {
        // _generate();
        timer.cancel();
        final images = await _generate(isNormal: isNormal);
        callback(images);
      }
    });
  }

  Future<List<String>> _generate({required bool isNormal}) async {
    //TODO: Change this to have both normal and super enhance
    List<String> images = await _repository.enhanceImage(url: _urlFile!);
    return images;
  }

  Map<String, dynamic> toJson() {
    return {
      'pathFile': _pathFile,
    };
  }

  PhotoEnhanceController fromJson(Map<String, dynamic> json) {
    return PhotoEnhanceController(json['pathFile']);
  }

  Future<bool> checkClicks(BuildContext context) {
    return _clickManager.checkClickAndHandle(context);
  }
}