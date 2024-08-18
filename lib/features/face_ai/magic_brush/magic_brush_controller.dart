import 'package:photo_ai/init/previous_image_storage.dart';

import '../../../generated/assets.dart';
import '../../../init/sl.dart';
import '../../../packages/index.dart';
import '../../click_management/click_management.dart';
import '../../widgets/elaborated_loading_overlay.dart';
import '../../widgets/permission_req.dart';
import 'magic_brush_state.dart';

class MagicBrushController extends Cubit<MagicBrushState> {

  MagicBrushController(String filePath, bool needUpload)
      : _pathFile = filePath,
        _needUpload = needUpload,
        super(const MagicBrushState(loading: true)){
    _init();
  }

  set fileSegmentation(String value) {
    _fileSegmentation = value;
  }

  final _repository = sl.get<Repository>();
  final _imageStorage = sl.get<PreviousImageStorage>();
  final _loadingOverlay = ElaboratedLoadingOverlay(url: Assets.loadingNormalLoading);
  late final bool _needUpload;
  late ScrollController _sc;
  final String _pathFile;
  String? _fileSegmentation;
  String? _urlFile;
  String? _prompt;

  void _init() async {
    if (_needUpload) {
      _urlFile = await _getUploadFileUrl(_pathFile);
    } else {
      _urlFile = _pathFile;
    }

  }

  Future<String> _getUploadFileUrl(String pathFile) async {
    if (pathFile.isBlank) {
      return '';
    }

    if (pathFile.startsWith('https')) {
      return pathFile;
    }
    String fileName = pathFile.split(Platform.pathSeparator).last;

    final storage = FirebaseStorage.instance
        .ref()
        .child('mobile-uploaded')
        .child('${Platform.pathSeparator}$fileName');

    try {
      await storage.putFile(File(pathFile));
    } on FirebaseException {
      // ...
    }

    String urlFile = await storage.getDownloadURL();
    return urlFile;
  }

  Future<void> setFileSegmentation(String filePath) async {
    _fileSegmentation = filePath;
    print(_fileSegmentation);
    return ;
  }

  Future<String?> getFileSegmentation() async {


    return _fileSegmentation;
  }
  void setPrompt(String text){
    _prompt = text;
    print(_prompt);
    return;
  }


  Future<void> generate(void Function(List<String> images) callback,
      {required BuildContext context}) async {
    print("start gen");
    if (_pathFile.isBlank) {
      callback([]);
      return;
    }
    if (_fileSegmentation.isBlank) {
      callback([]);
      return;
    }
    _urlFile = await _getUploadFileUrl(_pathFile);
    _fileSegmentation = await _getUploadFileUrl(_fileSegmentation!);
    print("pass 1");
    if (_urlFile.isNotBlank&&_fileSegmentation.isNotBlank) {
      final images = await _generate();
      callback(images);
      return;
    }
    print("pass 2");
    Timer.periodic(100.milliseconds, (timer) async {
      if (!_urlFile.isBlank&&!_fileSegmentation.isBlank) {
        timer.cancel();
        var images = await _generate();
        callback(images);
      }
    });
    print("pass 3");
    return;
  }

  Future<List<String>> _generate() async {

    print("genning");
    List<String> urls = await _repository.magicBrushGenerate(userImageUrl: _urlFile!, segmentImageUrl: _fileSegmentation!, prompt: _prompt!);
    print("genned");
    return urls;
  }



}
