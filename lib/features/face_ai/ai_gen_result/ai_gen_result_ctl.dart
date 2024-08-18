import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../../init/sl.dart';
import '../../../packages/index.dart';
import '../../click_management/click_management.dart';
import 'ai_gen_result_state.dart';

class AIGenResultController extends Cubit<AIGenResultState> {
  final _repository = sl.get<Repository>();
  final _clickManager = sl.get<ClickManagement>();
  final _cache = DefaultCacheManager();
  late Key carouselKey;

  AIGenResultController(List<String> imagesUrl)
      : super(AIGenResultState(images: imagesUrl)) {
    _init();
  }

  void _init() {
    carouselKey = UniqueKey();
  }

  Future<void> downloadImage(String imageUrl) async {
    String filePath = await _createFilePath(imageUrl);
    String? path = await _repository.downloadImage(
      imageUrl: imageUrl,
      pathFile: filePath,
    );

    print('============== path $path');
  }

  void updateImageUrls(List<String> imageUrls) {
    carouselKey = UniqueKey();
    emit(state.copyWith(images: imageUrls, currentIndex: 0));
  }

  Future<void> saveNetworkImage(String url) async {
    await _repository.saveGeneratedImage(imageUrl: url);
  }

  void updateCurrentIndex({required int index}) {
    emit(state.copyWith(currentIndex: index));
  }


  void updateDisplayImages(List<String> imageUrls) {
    List<String> urls = [];

    for(int i = 0; i < state.images.length; i++) {
      if(i == state.currentIndex) {
        urls.addAll(imageUrls);
      } else {
        urls.add(state.images[i]);
      }
    }

    emit(state.copyWith(
      images: urls,
    ));
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
        .child('${Platform.pathSeparator}$fileName.jpg');

    try {
      await storage.putFile(File(pathFile));
    } on FirebaseException {
      // ...
    }

    String urlFile = await storage.getDownloadURL();
    return urlFile;
  }


  Future<String> _createFilePath(String url) async {
    String fileName = url.split("/").last;
    Directory? downloadsDirectory = await getDownloadsDirectory();
    String genAIFolderPath = '${downloadsDirectory!.path}/GenAI';
    Directory genAIDirectory = Directory(genAIFolderPath);
    if (!await genAIDirectory.exists()) {
      await genAIDirectory.create(recursive: true);
    }
    return '$genAIFolderPath/$fileName';
  }

  Future<bool> checkClicks(BuildContext context) {
    return _clickManager.checkClickAndHandle(context);
  }

  Future<void> enhance(void Function(List<String> images) callback) async {
    final file = await _cache.getSingleFile(state.images[state.currentIndex]);
    String url = await _getUploadFileUrl(file.path);
    //TODO: Change to super enhance
    List<String> images = await _repository.enhanceImage(url: url);
    callback(images);
  }
}
