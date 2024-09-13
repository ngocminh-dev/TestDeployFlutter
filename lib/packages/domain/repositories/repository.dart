import 'package:photo_ai/packages/domain/dto/predefined_image_dto.dart';

import '../../index.dart';

abstract class Repository {
  static Local get local => Local.instance;

  Future<List<CategoryDto>> getCategoriesTextStyle();

  Future<List<CategoryDto>> getCategoriesInPainting();

  Future<List<String>> generateTextStyle({
    required String url,
    List<String>? traits,
    String? additions,
  });

  Future<int> getNumberOfClicks();

  Future<String> createAnonymousUser();

  Future<List<String>> enhanceImage({required String url});
  Future<List<String>> blurBackground({required String url});
  static NetworkSrc createNetworkSrc({required Local local}) {
    return NetworkSrc.instance();
  }

  static Future<Repository> createRepository({
    required AppEvent appEvent,
    required Local local,
  }) async {
    NetworkSrc networkSrc = createNetworkSrc(local: local);

    final apiService = ApiServiceImpl.instance(networkSrc.dioService,
        networkSrc.downloadDioService, networkSrc.commonDioService);

    return RepositoryImpl.instance(apiService: apiService);
  }

  Future<PricingDto?> getPricing();

  Future<String?> downloadImage({
    required String imageUrl,
    required String pathFile,
  });

  Future<List<String>> generateInPainting({
    required String url,
    List<String>? traits,
    String? additions,
    List<String>? categoriesHavingAdditions,
  });

  Future<PaymentDto?> createQr({required int numClick});

  Future<PaymentStatusDto?> watchQr({required String orderId});

  Future<void> saveGeneratedImage({required String imageUrl});

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

  Future<List<PredefinedImageDto>> getImageTemplatesPhotoStyle();

  Future<List<PredefinedImageDto>> getImageTemplatesFaceSwap();

  Future<void> inAppPurchaseStorePurchase(
      {required String purchaseId,
      required String completedAt,
      required double transferAmount,
      required String transferCurrency,
      required int clicksAdded,
      required String deviceInfo,
      required bool success,
      String? message});
}
