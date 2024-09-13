import '../../packages/index.dart';
import '../index.dart';

class ShowToastController {
  static void showToast(BuildContext context,
      {required String type,
      required String message,
      bool navigateClick = false,
      bool barrierDismissible = true,
        Function? onClose,
      }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: ToastMessage(
              type: type,
              message: message,
              callback: () {
                if (navigateClick) {
                  _openPaymentPage(context);
                } else {
                  _removeToast(context);
                  if(onClose != null) {
                    onClose();
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }

  static void _removeToast(BuildContext context) {
    Navigator.pop(context);
  }

  static void _openPaymentPage(BuildContext context) async {
    _removeToast(context);
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ClickManagementPage(countryCode: Config.countryCode)),
      );
    }
  }
}
