import 'package:photo_ai/init/previous_image_storage.dart';

import '../../../generated/assets.dart';
import '../../../init/sl.dart';
import '../../../packages/index.dart';
import '../../widgets/elaborated_loading_overlay.dart';
import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(const HomeState(loading: true));

  final _imageStorage = sl.get<PreviousImageStorage>();
  final _loadingOverlay = ElaboratedLoadingOverlay(url: Assets.loadingNormalLoading);
  bool _hasPreviousImage = false;
  String? _previousImagePath;

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
