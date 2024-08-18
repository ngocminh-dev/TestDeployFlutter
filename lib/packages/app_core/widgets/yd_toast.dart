import '../../index.dart';

class YDToast {
  const YDToast._();

  static Widget Function(BuildContext context, Widget? child) builder() {
    return BotToastInit();
  }

  static NavigatorObserver obs() {
    return BotToastNavigatorObserver();
  }

  static Function showNotiToast(
    Widget content, {
    VoidCallback? onClose,
    Alignment align = const Alignment(0, -1),
  }) {
    return BotToast.showCustomNotification(
      useSafeArea: true,
      align: align,
      duration: const Duration(milliseconds: AppStyleConstant.toastDuration),
      onClose: onClose,
      toastBuilder: (_) {
        return content;
      },
    );
  }

  /// Show loading indicator when called. Usage:
  ///
  /// To show loading: [final cancel = YDToast.showLoadingToast;]
  ///
  /// To dismiss: [cancel();]
  static Function showLoadingToast({
    VoidCallback? onClose,
    required Widget child,
  }) {
    return BotToast.showCustomLoading(
      onClose: onClose,
      backgroundColor: Colors.transparent,
      toastBuilder: (void Function() cancelFunc) {
        return child;
      },
    );
  }

  /// Show loading indicator during the execution of [future].
  ///
  /// Returns the result of the [future].
  static Future<T> showAutoDismissLoading<T>({
    required Future<T> future,
    VoidCallback? onClose,
    Widget? child,
    int durationAutoDismissIfError = 3,
  }) async {
    final cancel = child != null
        ? BotToast.showCustomLoading(
            onClose: onClose,
            backgroundColor: Colors.transparent,
            toastBuilder: (cancelFunc) {
              return child;
            },
          )
        : BotToast.showLoading(
            onClose: onClose,
            backgroundColor: Colors.transparent,
          );
    Future.delayed(Duration(seconds: durationAutoDismissIfError), () {
      cancel();
    });
    final result = await future;
    cancel();
    return result;
  }
}
