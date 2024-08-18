import 'package:after_layout/after_layout.dart';
import 'package:photo_ai/features/intro_slider/splash/splash_controller.dart';
import 'package:photo_ai/features/intro_slider/splash/splash_state.dart';

import '../../../../packages/index.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin<SplashPage>{
  late final SplashController _controller;

  SplashController _createController() {
    _controller = SplashController();
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(),
      child: BlocBuilder<SplashController, SplashState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                color: Colors.white
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await _controller.checkFirstSeen(context);
  }
}
