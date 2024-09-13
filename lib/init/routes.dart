import 'package:photo_ai/features/intro_slider/slider/slider_page.dart';
import 'package:photo_ai/features/intro_slider/splash/splash_page.dart';

import '../features/face_ai/index.dart';
import '../features/face_ai/magic_brush/magic_brush_page.dart';
import '../features/index.dart';
import '../packages/index.dart';

/// The route configuration.
/// state.pathParameters['userId']
/// state.uri.queryParameters['filter']
///
///
///

abstract class AppRouter {
  AppRouter._();

  static const String home = 'home';
  static const String photoEnhance = 'photo_enhance';
  static const String faceAI = 'face_ai';
  static const String faceAIResult = 'face_ai_result';
  static const String enhanceLoading = 'photo_enhance_loading';
  static const String qrCodePayment = 'qr_code_payment';
  static const String imageGenPage = 'image_gen_page';
  static const String introSlider = 'intro_slider';
  static const String realStyle = 'real_style';
  static const String makeUp = 'make_up';
  static const String magicBrush = 'magic_brush';
  static const String splash = '/';
}

extension AppNavigator on BuildContext {
  void navigatePhotoEnhance({required String pathFile}) {
    pushNamed(AppRouter.photoEnhance, queryParameters: {
      'pathFile': pathFile,
    });
  }

  void navigateRealStyle({required String pathFile, required String needUpload}) {
    pushNamed(AppRouter.realStyle, queryParameters: {
      'pathFile': pathFile,
      'needUpload': needUpload,
    });
  }

  void navigateRealStyleReplacement({required String pathFile}) {
    pushReplacementNamed(AppRouter.realStyle, queryParameters: {
      'pathFile': pathFile,
      'needUpload': 'true',
    });
  }

  void navigatePhotoEnhanceReplacement({required String pathFile}) {
    pushReplacementNamed(AppRouter.photoEnhance, queryParameters: {
      'pathFile': pathFile,
    });
  }

  void navigateHome({required bool checkNavigate}) {
    pushReplacementNamed(AppRouter.home, queryParameters: {
      'checkNavigate': checkNavigate.toString(),
    });
  }

  void navigateQrCodePayment({required String pathFile}) {
    pushNamed(
      AppRouter.qrCodePayment,
    );
  }

  void navigateAIFace({required String pathFile, required String needUpload}) {
    pushNamed(AppRouter.faceAI, queryParameters: {
      'pathFile': pathFile,
      'needUpload': needUpload,
    });
  }

  void navigateIntroSlider() {
    pushReplacementNamed(AppRouter.introSlider, queryParameters: {});
  }

  void navigateAIFaceResult({required List<String> images}) {
    pushNamed(AppRouter.faceAIResult, queryParameters: {
      'images': images,
    });
  }

  void navigateAIFaceResultReplacement({required List<String> images}) {
    pushReplacementNamed(AppRouter.faceAIResult, queryParameters: {
      'images': images,
    });
  }

  void navigateImageGenPage({required String pathFile, required String needUpload}) {
    pushNamed(AppRouter.imageGenPage, queryParameters: {
      'pathFile': pathFile,
      'needUpload': needUpload,
    });
  }

  void navigateMakeUpPage({required String pathFile, required String needUpload}) {
    pushNamed(AppRouter.makeUp, queryParameters: {
      'pathFile': pathFile,
      'needUpload': needUpload,
    });
  }

void navigateMagicBrushPage({required  String pathFile,required String needUpload}) {
  pushNamed(AppRouter.magicBrush, queryParameters: {
    'pathFile': pathFile,
    'needUpload': needUpload,
  });
}
}
final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  observers: [YDToast.obs()],
  routes: <RouteBase>[
    GoRoute(
      name: AppRouter.splash,
      path: AppRouter.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          name: AppRouter.photoEnhance,
          path: AppRouter.photoEnhance,
          builder: (BuildContext context, GoRouterState state) {
            String pathFile = state.uri.queryParameters['pathFile'] as String;
            return PhotoEnhancePage(filePath: pathFile);
          },
        ),
        GoRoute(
          name: AppRouter.realStyle,
          path: AppRouter.realStyle,
          builder: (BuildContext context, GoRouterState state) {
            String pathFile = state.uri.queryParameters['pathFile'] as String;
            String needUpload = state.uri.queryParameters['needUpload'] as String;
            bool need = needUpload == 'true' ? true : false;
            return RealStylePage(pathFile: pathFile, needUpload: need,);
          },
        ),
        GoRoute(
          name: AppRouter.makeUp,
          path: AppRouter.makeUp,
          builder: (BuildContext context, GoRouterState state) {
            String pathFile = state.uri.queryParameters['pathFile'] as String;
            String needUpload = state.uri.queryParameters['needUpload'] as String;
            bool need = needUpload == 'true';
            return MakeUpPage(pathFile: pathFile, needUpload: need,);
          },
        ),
        GoRoute(
          name: AppRouter.magicBrush,
          path: AppRouter.magicBrush,
          builder: (BuildContext context, GoRouterState state) {
            String pathFile = state.uri.queryParameters['pathFile'] as String;
            String needUpload = state.uri.queryParameters['needUpload'] as String;
            bool need = needUpload == 'true';
            return MagicBrushPage(filePath: pathFile, needUpload: need,);
          },
        ),
        GoRoute(
          name: AppRouter.faceAI,
          path: AppRouter.faceAI,
          builder: (BuildContext context, GoRouterState state) {
            String pathFile = state.uri.queryParameters['pathFile'] as String;
            String needUpload = state.uri.queryParameters['needUpload'] as String;
            bool need = needUpload == 'true' ? true : false;
            return FaceAiPage(pathFile: pathFile, needUpload: need,);
          },
        ),
        GoRoute(
          name: AppRouter.faceAIResult,
          path: AppRouter.faceAIResult,
          builder: (BuildContext context, GoRouterState state) {
            var images = state.uri.queryParametersAll['images'] as List<String>;
            return AIGenResultPage(
              images: images,
            );
          },
        ),
        GoRoute(
          name: AppRouter.imageGenPage,
          path: AppRouter.imageGenPage,
          builder: (BuildContext context, GoRouterState state) {
            String pathFile = state.uri.queryParameters['pathFile'] as String;
            String needUpload = state.uri.queryParameters['needUpload'] as String;
            bool need = needUpload == 'true';
            return ImageGenPage(pathFile: pathFile, needUpload: need,);
          },
        ),
        GoRoute(
          name: AppRouter.home,
          path: AppRouter.home,
          builder: (BuildContext context, GoRouterState state) {
            String checkNavigate = state.uri.queryParameters['checkNavigate'] as String;
            bool checkNav = checkNavigate == 'true';
            return HomePage(checkNavigate: checkNav,);
          },
        ),
        GoRoute(
          name: AppRouter.introSlider,
          path: AppRouter.introSlider,
          builder: (BuildContext context, GoRouterState state) {
            return const SliderPage();
          },
        )
      ],
    ),
  ],
);
