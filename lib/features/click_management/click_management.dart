import 'package:photo_ai/generated/index.dart';

import '../../init/sl.dart';
import '../../packages/index.dart';
import '../showToast/show_toast_controller.dart';
import 'click_page.dart';

class ClickManagement {
  final _repository = sl.get<Repository>();

  Future<int> _getNumOfClicks() async {
    try {
      return _repository.getNumberOfClicks();
    } on Exception {
      return 0;
    }
  }

  Future<bool> checkClickAndHandle(BuildContext context) async {
    int clicks = await _getNumOfClicks();
    if (clicks == 0 && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ClickManagementPage(countryCode: Config.countryCode)),
      );
      return false;
    } else if (clicks == -1 && context.mounted) {
      ShowToastController.showToast(context,
          type: 'Error', message: context.loc.error_msg);
      return false;
    }
    return true;
  }
}
