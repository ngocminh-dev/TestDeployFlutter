import 'package:intro_slider/intro_slider.dart';
import 'package:photo_ai/features/intro_slider/slider/slider_controller.dart';
import 'package:photo_ai/features/intro_slider/slider/slider_state.dart';
import 'package:photo_ai/init/index.dart';

import '../../../../packages/index.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  late final SliderController _controller;

  SliderController _createController() {
    _controller = SliderController();
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _createController(),
      child: BlocBuilder<SliderController, SliderState>(
        builder: (context, state) {
          return Scaffold(
            body: IntroSlider(
              key: UniqueKey(),
              listContentConfig: _controller.listContentConfig,
              renderSkipBtn: const Text(
                'Skip',
                style: TextStyle(color: Colors.white),
              ),
              renderDoneBtn: const Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
              renderNextBtn: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
              onDonePress: () {
                context.navigateHome(checkNavigate: true);
              },
              indicatorConfig: const IndicatorConfig(
                  colorIndicator: Colors.white38,
                colorActiveIndicator: Colors.white
              ),
            ),
          );
        },
      ),
    );
  }
}
