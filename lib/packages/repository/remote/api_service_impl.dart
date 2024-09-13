import 'package:photo_ai/packages/domain/dto/predefined_image_dto.dart';

import '../../index.dart';

class ApiServiceImpl extends ApiService {
  static ApiService instance(DioService dioService, DioService downloadService,
      DioService commonService) {
    return ApiServiceImpl(dioService, downloadService, commonService);
  }

  ApiServiceImpl(DioService dioService, DioService downloadService,
      DioService commonService)
      : _dioService = dioService,
        _downloadService = downloadService,
        _commonService = commonService;

  final DioService _dioService;
  final DioService _downloadService;
  final DioService _commonService;

  @override
  Future<List<CategoryDto>> getCategoriesTextStyle() async {
    try {
      final json = await _dioService.getList(
        endpoint: 'text-style/categories',
        queryParams: {},
      );

      return json.map((e) => CategoryDto.fromJson(e)).toList();
    } on Exception {
      // var error = CustomException.fromDioException(ex);
      return [];
    }
  }

  @override
  Future<List<CategoryDto>> getCategoriesInPainting() async {
    try {
      final json = await _dioService.getList(
        endpoint: 'inpainting/categories',
        queryParams: {},
      );

      return json.map((e) => CategoryDto.fromJson(e)).toList();
    } on Exception {
      // var error = CustomException.fromDioException(ex);
      return [];
    }
  }

  @override
  Future<List<String>> generateTextStyle({
    required String url,
    String? personId,
    List<String>? traits,
    String? additions,
  }) async {
    try {
      List<String> result = await _dioService.postList(
        endpoint: 'text-style/generate',
        data: {
          "image_link": url,
          "traits": traits ?? [],
          "additions": additions,
        },
      );
      return result;
    } on Exception {
      // var error = CustomException.fromDioException(ex);
      return [];
    }
  }

  @override
  Future<List<String>> generateInPainting({
    required String url,
    List<String>? traits,
    String? additions,
    List<String>? categoriesHavingAdditions,
  }) async {
    try {
      List<String> result = await _dioService.postList(
        endpoint: 'inpainting/generate',
        data: {
          "image_link": url,
          "traits": traits ?? [],
          "additions": additions,
          "categories_having_additions": categoriesHavingAdditions ?? [],
        },
      );
      return result;
    } on Exception {
      // var error = CustomException.fromDioException(ex);
      return [];
    }
  }

  @override
  Future<List<String>> enhanceImage({required String url}) async {
    try {
      List<String> result = await _dioService.mPost(
        endpoint: 'image-enhancer/generate',
        data: {"image_link": url},
      );
      print(result);
      return result;
    } on DioException catch (e) {
      print('DioException is: ${e.error}');
      return [];
    } catch (er) {
      print(er);
      return [];
    }
  }

  @override
  Future<String?> downloadImage({
    required String imageUrl,
    required String pathFile,
  }) async {
    try {
      await _downloadService.download(imageUrl, pathFile);
      return pathFile;
    } catch (error) {
      print('Đã xảy ra lỗi khi tải ảnh về máy');
      return null;
    }
  }

  @override
  Future<PricingDto?> getPricing() async {
    try {
      final json = await _commonService.get(endpoint: 'pricing');
      return PricingDto.fromJson(json);
    } on Exception {
      return null;
    }
  }

  @override
  Future<PaymentDto?> createQr({required int numClicks}) async {
    try {
      final json = await _dioService.post(
        endpoint: 'vietqr/create',
        data: {"num_clicks": numClicks},
      );
      return PaymentDto.fromJson(json);
    } on Exception {
      return null;
    }
  }

  @override
  Future<PaymentStatusDto?> watchQr({required String orderId}) async {
    try {
      final json = await _dioService.post(
        endpoint: 'vietqr/watch',
        data: {"order_id": orderId},
      );
      return PaymentStatusDto.fromJson(json);
    } on Exception {
      return null;
    }
  }

  @override
  Future<UserDto?> getUserInfo() async {
    try {
      final json = await _dioService.get(
        endpoint: 'auth/info',
        queryParams: {},
      );

      return UserDto.fromJson(json);
    } on Exception {
      // var error = CustomException.fromDioException(ex);
      return null;
    }
  }

  @override
  Future<String> createAnonymousUser() async {
    try {
      final json = await _dioService.get(
        endpoint: 'auth/anonymous',
        queryParams: {},
      );

      return json['access_token'];
    } on Exception {
      print("Error creating anonymous user");
      return '';
    }
  }

  @override
  Future<List<int>?> getGeneratedImage({required String imageUrl}) async {
    var response = await Dio().get(imageUrl,
        options: Options(
          responseType: ResponseType.bytes,
          receiveTimeout: const Duration(seconds: 60),
        ));
    return response.data;
  }

  @override
  Future<void> inAppPurchaseStorePurchase(
      {required String purchaseId,
      required String completedAt,
      required double transferAmount,
      required String transferCurrency,
      required int addedClicks,
      required bool success,
      required String deviceInfo,
      String? message}) async {
    await _dioService.post(endpoint: 'iap', data: {
      'purchase_id': purchaseId,
      'completed_at': completedAt,
      'transfer_amount': transferAmount,
      'clicks_added': addedClicks,
      'transfer_currency': transferCurrency,
      'status': success ? 'COMPLETED' : 'FAILED',
      'device_info': deviceInfo,
      'message': message ?? '',
    });
  }

  @override
  Future<List<String>> faceSwapGenerate(
      {required String userImageUrl,
      required bool predefined,
      String? predefinedId,
      String? templateUrl}) async {
    try {
      List<String> result =
          await _dioService.postList(endpoint: 'swap/generate', data: {
        'user_photo': userImageUrl,
        if (predefinedId != null && predefinedId.isNotEmpty) 'template_id': predefinedId,
        if (templateUrl != null && templateUrl.isNotEmpty) 'template_photo': templateUrl,
      });
      return result;
    } on Exception {
      return [];
    }
  }

  @override
  Future<List<String>> genByImage({
    required String userPhoto,
    required String templateId,
  }) async {
    try {
      List<String> result =
          await _dioService.postList(endpoint: 'photo-style/generate', data: {
        'user_photo': userPhoto,
        'template_id': templateId,
      });
      return result;
    } on Exception {
      return [];
    }
  }

  @override
  Future<List<PredefinedImageDto>> getImageTemplatesPhotoStyle() async {
    try {
      final json = await _dioService.getList(
          endpoint: 'photo-style/templates', queryParams: {});
      return json.map((e) => PredefinedImageDto.fromJson(e)).toList();
    } on Exception {
      return [];
    }
  }

  @override
  Future<List<PredefinedImageDto>> getImageTemplatesFaceSwap() async {
    try {
      final json = await _dioService.getList(
          endpoint: 'swap/templates', queryParams: {});
      return json.map((e) => PredefinedImageDto.fromJson(e)).toList();
    } on Exception {
      return [];
    }
  }

  @override
  Future<List<String>> magicBrushGenerate({required String userImageUrl, required String segmentImageUrl, required String prompt}) async {
    // TODO: implement magicBrushGenerate
    try {
      List<String> result =
      await _dioService.postList(endpoint: 'magic-paint/generate', data: {
        'user_image': userImageUrl, 'segmented_user_image': segmentImageUrl,
        'prompt': prompt,
      });
      return result;
    } on Exception {
      return [];
    }
  }
  @override
  Future<List<String>> blurBackground({required String url}) async {
    try {
      List<String> result = await _dioService.postList(
        endpoint: 'blur-bg/generate',
        data: {"image_link": url},
      );
      print(result);
      return result;
    } on DioException catch (e) {
      print('DioException is: ${e.error}');
      return [];
    } catch (er) {
      print(er);
      return [];
    }
  }
}
