import 'package:photo_ai/features/face_ai/image_gen/image_gen_state.dart';
import 'package:photo_ai/features/index.dart';
import 'package:photo_ai/features/widgets/permission_req.dart';
import 'package:photo_ai/packages/domain/dto/predefined_image_dto.dart';

import '../../../init/sl.dart';
import '../../../packages/index.dart';

class ImageGenController extends Cubit<ImageGenState> {
  final _repository = sl.get<Repository>();
  final _clickManager = sl.get<ClickManagement>();
  late ScrollController _sc;
  final String _pathFile;
  List<PredefinedImageDto> _imageList = [];
  String? _urlFile;
  String? _uploadFilePath;
  late final bool _needUpload;
  final int currentImageIncrement = 20;

  final GlobalKey<AnimatedGridState> gridKey = GlobalKey<AnimatedGridState>();

  ImageGenController(String pathFile, bool needUpload)
      : _pathFile = pathFile,
        _needUpload = needUpload,
        super(const ImageGenState(loading: true)) {
    _init();
  }

  void _init() async {
    _sc = ScrollController();
    _sc.addListener(() async {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        await _getMoreImages();
      }
    });

    if (_needUpload) {
      _urlFile = await _getUploadFileUrl(_pathFile);
    } else {
      _urlFile = _pathFile;
    }

    _imageList = await _repository.getImageTemplatesFaceSwap();

    await _getMoreImages();
  }

  void dispose() {
    _sc.dispose();
  }

  ScrollController getScrollController() {
    return _sc;
  }

  void selectImage(int index) {
    emit(state.copyWith(
      selectedIndex: index,
      generateEnabled: true,
    ));
  }

  Future<bool> pickUploadImage(BuildContext context) async {
    _uploadFilePath = null;
    await PermissionReq.requestPhotoPermission(context, ({required pathFile}) {
      _uploadFilePath = pathFile;
      Navigator.pop(context);
    }, temporaryImage: true);

    if(_uploadFilePath == null || _uploadFilePath!.isEmpty) {
      return false;
    }

    return true;
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

  Future<void> _getMoreImages() async {
    if (!state.loading) {
      emit(state.copyWith(loading: true));
    }
    List<String> newImages = [];
    List<String> images = [];
    images.addAll(state.images);
    int srt = currentImageIncrement * state.currentPage;
    int end = currentImageIncrement * (state.currentPage + 1);
    for (int i = srt; i < _imageList.length && i < end; i++) {
      newImages.add(_imageList[i].url!);
      gridKey.currentState!
          .insertItem(i, duration: const Duration(milliseconds: 500));
    }
    images.addAll(newImages);
    emit(state.copyWith(
        loading: false, images: images, currentPage: state.currentPage + 1));
  }

  Future<void> generate(void Function(List<String> images) callback,
      {required BuildContext context}) async {
    if (_pathFile.isBlank) {
      callback([]);
      return;
    }

    if (_urlFile.isNotBlank) {
      final images = await _generate();
      callback(images);
      return;
    }
    Timer.periodic(100.milliseconds, (timer) async {
      if (!_urlFile.isBlank) {
        timer.cancel();
        var images = await _generate();
        callback(images);
      }
    });
    return;
  }

  Future<List<String>> _generate() async {
    String generateUrl = '';
    String predefinedId = '';
    bool predefined = true;
    if (_uploadFilePath == null && state.selectedIndex == null) {
      return [_urlFile!];
    }
    if (_uploadFilePath != null) {
      generateUrl = await _getUploadFileUrl(_uploadFilePath!);
      predefined = false;
    } else {
      predefinedId = _imageList[state.selectedIndex!].id!;
      predefined = true;
    }

    List<String> urls = await _repository.faceSwapGenerate(
        userImageUrl: _urlFile!,
        predefined: predefined,
        templateUrl: generateUrl,
        predefinedId: predefinedId);
    return urls;
  }

  Future<bool> checkClicks(BuildContext context) {
    return _clickManager.checkClickAndHandle(context);
  }
}
