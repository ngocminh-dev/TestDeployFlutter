import 'package:photo_ai/features/click_management/click_state.dart';
import '../../packages/index.dart';

import '../../init/sl.dart';

class ClickController extends Cubit<ClickState>{
  final _repository = sl.get<Repository>();
  ClickController({required int? clicks}) : super(ClickState(click: clicks));
  Future<int?> getNumberOfClicks() async
  {
    try{
      final response = await _repository.getNumberOfClicks();
      emit(state.copyWith(click: response));
      return response;
    } on Exception{
      return null;
    }
  }

  Future<PricingDto?> getPricing() async
  {
    return await _repository.getPricing();
  }
}