import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:photo_ai/features/purchase/in_app_purchase_state.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:photo_ai/features/purchase/in_app_payment_queue_delegate.dart';

import '../../../init/sl.dart';
import '../../../packages/index.dart';

class InAppPurchaseController extends Cubit<InAppPurchaseState> {
  final _repository = sl.get<Repository>();

  final bool _kAutoConsume = Platform.isIOS || true;

  final String _kConsumableId_50 = 'clicks_consumable_50';
  final String _kConsumableId_100 = 'clicks_consumable_100';
  final String _kConsumableId_200 = 'clicks_consumable_200';
  final String _kConsumableId_300 = 'clicks_consumable_300';
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<String> _productIds = <String>[];

  InAppPurchaseController() : super(const InAppPurchaseState()) {
    _init();
    _productIds = [
      _kConsumableId_50,
      _kConsumableId_100,
      _kConsumableId_200,
      _kConsumableId_300
    ];
  }

  Future<void> _init() async {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (Object error) {
      //TODO: Handle error here
    });
    await _initStoreInfo();
  }

  Future<void> _initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      emit(state.copyWith(
        isAvailable: isAvailable,
        products: <ProductDetails>[],
        purchases: <PurchaseDetails>[],
      ));
      return;
    }

    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(PaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailsResponse =
        await _inAppPurchase.queryProductDetails(_productIds.toSet());
    if (productDetailsResponse.error != null) {
      print(productDetailsResponse.error!.message);
    }
    if (productDetailsResponse.productDetails.isEmpty) {
      print("Error fetching product information");
    }
    emit(state.copyWith(
      isAvailable: isAvailable,
      products: productDetailsResponse.productDetails,
    ));
  }

  void dispose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    _subscription.cancel();
  }

  void _handleError(IAPError error) {
    print(error);
    emit(state.copyWith(
      pendingPurchase: false,
    ));
  }

  Future<bool> isStoreAvailable() async {
    return await _inAppPurchase.isAvailable();
  }

  Future<void> buyProduct(ProductDetails productDetails) async {
    PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);

    _inAppPurchase.buyConsumable(
        purchaseParam: purchaseParam, autoConsume: _kAutoConsume);
  }

  Future<void> _deliverProduct(PurchaseDetails purchaseDetails) async {
    String purchaseId = purchaseDetails.purchaseID!;
    DateTime completedTime = DateTime.fromMillisecondsSinceEpoch(
        int.parse(purchaseDetails.transactionDate!));
    String completedAt =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(completedTime);
    completedAt = '$completedAt GMT+0000';
    bool success = true;
    //TODO: Take a look at this
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
    String transferCurrency = format.currencyName!;
    double transferAmount = 0;
    int clicksAdded = 0;
    if (purchaseDetails.productID == _kConsumableId_50) {
      transferAmount = state.products[0].rawPrice;
      clicksAdded = 50;
    } else if (purchaseDetails.productID == _kConsumableId_100) {
      transferAmount = state.products[1].rawPrice;
      clicksAdded = 100;
    } else if (purchaseDetails.productID == _kConsumableId_200) {
      transferAmount = state.products[2].rawPrice;
      clicksAdded = 200;
    } else if (purchaseDetails.productID == _kConsumableId_300) {
      transferAmount = state.products[3].rawPrice;
      clicksAdded = 300;
    }
    String deviceInfo = await getDeviceInfo();
    _repository.inAppPurchaseStorePurchase(
        purchaseId: purchaseId,
        completedAt: completedAt,
        transferAmount: transferAmount,
        transferCurrency: transferCurrency,
        success: success,
        deviceInfo: deviceInfo,
        clicksAdded: clicksAdded);
    emit(state.copyWith(pendingPurchase: false));
  }

  Future<String> getDeviceInfo() async {
    String deviceInfo = '';
    var device = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await device.iosInfo;
      String deviceId = iosDeviceInfo.identifierForVendor!;
      String machine = iosDeviceInfo.utsname.machine;
      String systemVersion = iosDeviceInfo.systemVersion;
      String model = iosDeviceInfo.model;
      String systemName = iosDeviceInfo.systemName;deviceInfo =
          'id: $deviceId | machine: $machine | systemName: $systemName | systemVersion: $systemVersion | model: $model';
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await device.androidInfo;
      String deviceId = androidDeviceInfo.id;
      String deviceName = androidDeviceInfo.device;
      String hardware = androidDeviceInfo.hardware;
      String host = androidDeviceInfo.host;
      String manufacturer = androidDeviceInfo.manufacturer;
      String model = androidDeviceInfo.model;
      String bootloader = androidDeviceInfo.bootloader;
      deviceInfo =
          'id: $deviceId | name: $deviceName | hardware: $hardware | host: $host | manufacturer: $manufacturer | model: $model | bootloader: $bootloader';
    }
    return deviceInfo;
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        emit(state.copyWith(
          pendingPurchase: true,
        ));
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          _handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          unawaited(_deliverProduct(purchaseDetails));
        }
        if (Platform.isAndroid) {
          if (!_kAutoConsume &&
              purchaseDetails.productID == _kConsumableId_50) {
            final InAppPurchaseAndroidPlatformAddition androidAddition =
                _inAppPurchase.getPlatformAddition<
                    InAppPurchaseAndroidPlatformAddition>();
            await androidAddition.consumePurchase(purchaseDetails);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }
}
