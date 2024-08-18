import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart';
import 'package:photo_ai/packages/domain/dto/predefined_image_dto.dart';

import '../../index.dart';

class RepositoryImpl extends Repository {
  static Repository instance({required ApiService apiService}) {
    return RepositoryImpl(apiService);
  }

  RepositoryImpl(ApiService apiService,) : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<List<CategoryDto>> getCategoriesTextStyle() async {
    return _apiService.getCategoriesTextStyle();
  }

  @override
  Future<List<CategoryDto>> getCategoriesInPainting() async {
    return _apiService.getCategoriesInPainting();
  }

  @override
  Future<List<String>> generateTextStyle({
    required String url,
    String? personId,
    List<String>? traits,
    String? additions,
  }) {
    return _apiService.generateTextStyle(
      url: url,
      traits: traits,
      additions: additions,
    );
  }

  @override
  Future<List<String>> enhanceImage({required String url}) {
    return _apiService.enhanceImage(url: url);
  }

  @override
  Future<String?> downloadImage({
    required String imageUrl,
    required String pathFile,
  }) {
    return _apiService.downloadImage(
      imageUrl: imageUrl,
      pathFile: pathFile,
    );
  }

  @override
  Future<int> getNumberOfClicks() async {
    UserDto? user = await _apiService.getUserInfo();
    return user != null ? (user.freeClicks! + user.premiumClicks!) : 0;
  }

  @override
  Future<String> createAnonymousUser() async {
    return _apiService.createAnonymousUser();
  }

  @override
  Future<void> saveGeneratedImage({required String imageUrl}) async {
    final data = await _apiService.getGeneratedImage(imageUrl: imageUrl);

    if (data == null) {
      return;
    }
    await ImageGallerySaver.saveImage(Uint8List.fromList(data),
        quality: 60, name: basename(imageUrl));
  }

  @override
  Future<PricingDto?> getPricing() async {
    return _apiService.getPricing();
  }

  @override
  Future<PaymentDto?> createQr({required int numClick}) async {
    return _apiService.createQr(numClicks: numClick);
  }

  @override
  Future<PaymentStatusDto?> watchQr({required String orderId}) async {
    return _apiService.watchQr(orderId: orderId);
  }

  @override
  Future<void> inAppPurchaseStorePurchase({required String purchaseId,
    required String completedAt,
    required double transferAmount,
    required String transferCurrency,
    required int clicksAdded,
    required String deviceInfo,
    required bool success,
    String? message}) async {
    return _apiService.inAppPurchaseStorePurchase(
        purchaseId: purchaseId,
        completedAt: completedAt,
        transferAmount: transferAmount,
        transferCurrency: transferCurrency,
        addedClicks: clicksAdded,
        deviceInfo: deviceInfo,
        success: success,
        message: message);
  }

  @override
  Future<List<String>> faceSwapGenerate({required String userImageUrl,
    required bool predefined,
    String? predefinedId,
    String? templateUrl}) async {
    return _apiService.faceSwapGenerate(
        userImageUrl: userImageUrl,
        predefined: predefined,
        templateUrl: templateUrl,
        predefinedId: predefinedId
    );
  }


  @override
  Future<List<String>> generateInPainting({
    required String url,
    List<String>? traits,
    String? additions,
    List<String>? categoriesHavingAdditions,
  }) async {
    return _apiService.generateInPainting(url: url,
        traits: traits,
        additions: additions,
        categoriesHavingAdditions: categoriesHavingAdditions);
  }

  @override
  Future<List<String>> genByImage({
    required String userPhoto,
    required String templateId,
  }) async {
    return _apiService.genByImage(
        userPhoto: userPhoto, templateId: templateId);
  }

  @override
  Future<List<PredefinedImageDto>> getImageTemplatesPhotoStyle() async {
    return _apiService.getImageTemplatesPhotoStyle();
  }

  @override
  Future<List<PredefinedImageDto>> getImageTemplatesFaceSwap() async {
    return _apiService.getImageTemplatesFaceSwap();
  }

  @override
  Future<List<String>> magicBrushGenerate({required String userImageUrl, required String segmentImageUrl, required String prompt}) {
    return _apiService.magicBrushGenerate(userImageUrl: userImageUrl, segmentImageUrl: segmentImageUrl, prompt: prompt);
  }


}
