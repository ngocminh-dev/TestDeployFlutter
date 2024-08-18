import 'package:intro_slider/intro_slider.dart';
import 'package:photo_ai/features/intro_slider/slider/slider_state.dart';
import 'package:photo_ai/generated/assets.dart';

import '../../../packages/index.dart';

class SliderController extends Cubit<SliderState> {
  SliderController() : super(const SliderState(loading: false)) {
    _init();
  }

  List<ContentConfig> _listContentConfig = [];

  void _init() {
    _listContentConfig.add(
      const ContentConfig(
          title: 'GENERATE WITH TEXT',
          description: 'Description?',
          pathImage: Assets.imgRequestPhotosCamera,
          backgroundImage: Assets.backgroundColor1,
          backgroundImageFit: BoxFit.fill),
    );

    _listContentConfig.add(
      const ContentConfig(
        title: 'GENERATE WITH IMAGE',
        description: 'Description?',
        pathImage: Assets.imgRequestPhotosCamera,
        backgroundImage: Assets.backgroundColor2,
        backgroundImageFit: BoxFit.fill,
      ),
    );

    _listContentConfig.add(
      const ContentConfig(
          title: 'CHANGE POSTURE',
          description: 'Description?',
          pathImage: Assets.imgRequestPhotosCamera,
          backgroundImage: Assets.backgroundColor3,
          backgroundImageFit: BoxFit.fill),
    );
  }

  List<ContentConfig> get listContentConfig => _listContentConfig;
}
