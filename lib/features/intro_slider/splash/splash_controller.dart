import 'package:photo_ai/features/intro_slider/splash/splash_state.dart';
import 'package:photo_ai/init/routes.dart';
import 'package:photo_ai/packages/index.dart';

class SplashController extends Cubit<SplashState> {
  SplashController() : super(const SplashState());

  Future<void> checkFirstSeen(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    if (seen) {
      if (context.mounted) {
        context.navigateHome(checkNavigate: true);
      }
    } else {
      await prefs.setBool('seen', true);
      if (context.mounted) {
        context.navigateIntroSlider();
      }
    }
  }
}
