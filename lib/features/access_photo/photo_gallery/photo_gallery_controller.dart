import 'package:path/path.dart';
import 'package:photo_ai/features/access_photo/photo_gallery/photo_gallery_state.dart';
import 'package:photo_ai/features/widgets/face_decector_util.dart';
import 'package:photo_ai/generated/extension.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

import '../../../init/previous_image_storage.dart';
import '../../../init/sl.dart';
import '../../../packages/index.dart';
import '../../show_toast/show_toast_controller.dart';

class PhotoGalleryController extends Cubit<PhotoGalleryState> {
  final _imageStorage = sl.get<PreviousImageStorage>();
  late final bool? _temporaryImage;
  late final TickerProvider _vsync;
  late final TabController tabController;
  late final void Function({required String pathFile}) _navigateFunction;

  final GlobalKey<AnimatedGridState> gridKey = GlobalKey<AnimatedGridState>();

  PhotoGalleryController(
      void Function({required String pathFile}) navigateFunction,
      {required TickerProvider vsync,
      bool? temporaryImage})
      : _navigateFunction = navigateFunction,
        _temporaryImage = temporaryImage,
        _vsync = vsync,
        super(const PhotoGalleryState(loading: false)) {
    _init();
  }

  void _init() {
    tabController = TabController(length: 2, vsync: _vsync);
    tabController.addListener(() {
      emit(state.copyWith(
        currentIndex: tabController.index,
      ));
      if(state.currentIndex == 1 && state.faceAssets.isEmpty) {
        fetchFaceAssets();
      }
    });
  }

  Future<void> _saveImage(File? img) async {
    if (img == null) {
      return;
    }

    final image = XFile(img.path);

    if (await _imageStorage.checkPreviousSavedImage()) {
      final file = File(await _imageStorage.getPreviousSavedImagePath());
      await file.delete();
    }

    final Directory dir = await getApplicationDocumentsDirectory();
    final String documentPath = dir.path;

    final fileName = basename(image.path);
    final storagePath = '$documentPath/$fileName';

    await image.saveTo(storagePath);

    _imageStorage.savePreviousImagePath(storagePath);
  }

  Future<void> fetchAssets() async {
    List<AssetEntity> assets = await PhotoManager.getAssetListRange(
        start: 0, end: 3000, type: RequestType.image);

    emit(state.copyWith(allAssets: assets));
  }

  Future<void> fetchFaceAssets() async {
    for (int i = 0; i < state.allAssets.length; i++) {
      var asset = state.allAssets[i];
      final bytes = await asset.thumbnailData;

      final appDir = await syspaths.getTemporaryDirectory();
      File file = File('${appDir.path}/temp_img.jpg');
      await file.writeAsBytes(bytes!);

      if (await FaceDetectorUtil.checkImageHasFace(file)) {
        List<AssetEntity> assetsAfterDetect = [];
        assetsAfterDetect.addAll(state.faceAssets);
        assetsAfterDetect.add(asset);
        emit(state.copyWith(
          faceAssets: assetsAfterDetect,
          progress: i/state.allAssets.length
        ));
      }
    }
  }

  Future<void> pickFromFaceAssets(BuildContext context, int index) async {
    final bytes = await state.faceAssets[index].thumbnailDataWithOption(
        const ThumbnailOption(size: ThumbnailSize.square(400), quality: 100));

    final tempDir = await getTemporaryDirectory();
    File file = await File(
            '${tempDir.path}/face_image-${DateTime.now().millisecondsSinceEpoch}-$index.jpg')
        .create();
    file.writeAsBytesSync(bytes!);

    if (_temporaryImage != true) {
      _saveImage(file);
    }

    _navigateFunction(pathFile: file.path);
  }

  Future<void> pickFromAllAssets(BuildContext context, int index) async {
    final bytes = await state.allAssets[index].thumbnailDataWithOption(
        const ThumbnailOption(size: ThumbnailSize.square(400), quality: 100));

    final tempDir = await getTemporaryDirectory();
    File file = await File(
            '${tempDir.path}/all_image-${DateTime.now().millisecondsSinceEpoch}-$index.jpg')
        .create();
    file.writeAsBytesSync(bytes!);

    if (_temporaryImage != true) {
      _saveImage(file);
    }

    bool hasFace = await FaceDetectorUtil.checkImageHasFace(file);

    if (!hasFace && context.mounted && _temporaryImage == true) {
      ShowToastController.showToast(context,
          type: 'Warning',
          message:
              context.loc.no_face_force_warning);
    } else {
      _navigateFunction(pathFile: file.path);
    }
  }
}
