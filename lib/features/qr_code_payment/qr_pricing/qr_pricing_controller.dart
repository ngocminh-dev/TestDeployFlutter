import './index.dart';
import '../../../init/sl.dart';
import '../../../packages/index.dart';

class QrPricingController extends Cubit<QrPricingState>{
  final _repository = sl.get<Repository>();
  QrPricingController() : super(const QrPricingState(loading: true));

  Future<PaymentDto?> createQr(int numClicks) async {
    try{
      return _repository.createQr(numClick: numClicks);
    } on Exception {
      return null;
    }
  }




}