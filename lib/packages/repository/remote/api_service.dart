import 'package:photo_ai/packages/domain/dto/predefined_image_dto.dart';

import '../../domain/index.dart';

abstract class ApiService {
  Future<List<CategoryDto>> getCategoriesTextStyle();

  Future<List<CategoryDto>> getCategoriesInPainting();

  Future<List<String>> generateTextStyle({
    required String url,
    List<String>? traits,
    String? additions,
  });

  Future<List<String>> enhanceImage({required String url});
  Future<List<String>> blurBackground({required String url});
  Future<String?> downloadImage({
    required String imageUrl,
    required String pathFile,
  });

  Future<List<int>?> getGeneratedImage({
    required String imageUrl,
  });

  Future<List<String>> faceSwapGenerate({
    required String userImageUrl,
    required bool predefined,
    String? predefinedId,
    String? templateUrl
});

  Future<List<String>> magicBrushGenerate({
    required String userImageUrl,
    required String segmentImageUrl,
    required String prompt,
  });


  Future<List<String>> genByImage({
    required String userPhoto,
    required String templateId,
});

  Future<List<String>> generateInPainting({
    required String url,
    List<String>? traits,
    String? additions,
    List<String>? categoriesHavingAdditions,
  });

  Future<List<PredefinedImageDto>> getImageTemplatesPhotoStyle();

  Future<List<PredefinedImageDto>> getImageTemplatesFaceSwap();

  Future<UserDto?> getUserInfo();

  Future<String> createAnonymousUser();

  Future<PricingDto?> getPricing();

  Future<void> inAppPurchaseStorePurchase({
    required String purchaseId,
    required String completedAt,
    required double transferAmount,
    required String transferCurrency,
    required int addedClicks,
    required bool success,
    required String deviceInfo,
    String? message});

  Future<PaymentDto?> createQr({required int numClicks});

  Future<PaymentStatusDto?> watchQr({required String orderId});
}
