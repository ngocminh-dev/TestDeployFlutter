import '../../../init/sl.dart';
import '../../../packages/index.dart';
import './index.dart';

class QrDisplayController extends Cubit<QrDisplayState> {
  late Timer? _timer;
  final _repository = sl.get<Repository>();

  QrDisplayController(PaymentDto? paymentInfo)
      : super(QrDisplayState(paymentInfo: paymentInfo));

  void checkPaymentStatusPeriodically(String orderId) {
    int cnt = 200;
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      final paymentStatus = await watchQr(orderId);
      cnt--;
      if (cnt == 0) {
        timer.cancel();
      }
      if (paymentStatus != null &&
          (paymentStatus.status == 'COMPLETED' ||
              paymentStatus.status == 'FAILED')) {
        if (state.status?.status != paymentStatus.status) {
          emit(state.copyWith(status: paymentStatus));
        }
        timer.cancel();
        return;
      }
    });
  }

  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  Future<PaymentStatusDto?> watchQr(String orderId) async {
    try {
      return _repository.watchQr(orderId: orderId);
    } on Exception {
      return null;
    }
  }

  Future<int?> getClicks() async {
    try {
      return _repository.getNumberOfClicks();
    } on Exception {
      return null;
    }
  }
}
