import 'package:photo_ai/init/previous_image_storage.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

import '../../../generated/assets.dart';
import '../../../init/sl.dart';
import '../../../packages/index.dart';
import '../../widgets/elaborated_loading_overlay.dart';
import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(const HomeState(loading: true)) {
    _init();
  }

  final _imageStorage = sl.get<PreviousImageStorage>();
  final _loadingOverlay = ElaboratedLoadingOverlay(url: Assets.loadingNormalLoading);
  bool _hasPreviousImage = false;
  String? _previousImagePath;

  final _shorebirdCodePush = ShorebirdCodePush();

  late final bool _isShorebirdAvailable;

  void _init() {
    _isShorebirdAvailable = _shorebirdCodePush.isShorebirdAvailable();

    _shorebirdCodePush.currentPatchNumber().then((currentPatchVersion) {
      emit(state.copyWith(currentPatchVersion: currentPatchVersion ?? 0));
    });
  }

  Future<bool> checkForUpdate(BuildContext context) async {
    return await _shorebirdCodePush.isNewPatchAvailableForDownload();
  }

  bool isShoreBirdAvailable() {
    return _isShorebirdAvailable;
  }

  Future<void> downloadUpdate(BuildContext context) async {
    await Future.wait([
      _shorebirdCodePush.downloadUpdateIfAvailable(),
      Future<void>.delayed(const Duration(milliseconds: 250)),
    ]);
  }

  Future<void> checkPreviousImage({required BuildContext context}) async {
    _loadingOverlay.showLoadingOverlay(context);
    _hasPreviousImage = await _imageStorage.checkPreviousSavedImage();
    _previousImagePath = _hasPreviousImage ? await _imageStorage.getPreviousSavedImagePath() : null;

    _loadingOverlay.removeLoadingOverlay();
  }

  bool hasPreviousImage() {
    return _hasPreviousImage;
  }

  String? getPreviousImagePath() {
    return _previousImagePath;
  }
}
