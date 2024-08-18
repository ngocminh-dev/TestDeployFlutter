import 'package:after_layout/after_layout.dart';
import 'package:photo_ai/features/purchase/in_app_purchase_ctl.dart';
import 'package:photo_ai/features/purchase/in_app_purchase_state.dart';

import '../../../generated/assets.dart';
import '../../../packages/index.dart';
import '../../index.dart';

class PricingPage extends StatefulWidget {
  final PricingDto? pricing;
  final String paymentMethod;

  const PricingPage(this.pricing, this.paymentMethod, {super.key});

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> with AfterLayoutMixin<PricingPage>{
  late final QrPricingController? _qrPricingController;
  late final InAppPurchaseController? _inAppPurchaseController;
  int _price = 0;
  final _loadingOverlay =
      ElaboratedLoadingOverlay(url: Assets.loadingPaymentLoading);
  int _selectedIndex = 0;

  QrPricingController _createQRController() {
    _qrPricingController = QrPricingController();
    _inAppPurchaseController = null;
    return _qrPricingController!;
  }

  InAppPurchaseController _createInAppController() {
    _inAppPurchaseController = InAppPurchaseController();
    _qrPricingController = null;
    return _inAppPurchaseController!;
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    if(widget.paymentMethod == 'in_app_payment') {
      bool storeAvailable = await _inAppPurchaseController!.isStoreAvailable();

      if(!storeAvailable && context.mounted) {
        Navigator.pop(context);
        ShowToastController.showToast(context, type: 'Error', message: 'There is an error with In App Purchase. Please try again later');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.paymentMethod == 'qr_payment') {
      return BlocProvider(
        create: (context) => _createQRController(),
        child: BlocBuilder<QrPricingController, QrPricingState>(
          builder: (context, state) {
            return Scaffold(
              body: _buildUI(context, null),
            );
          },
        ),
      );
    } else {
      return BlocProvider(
        create: (context) => _createInAppController(),
        child: BlocBuilder<InAppPurchaseController, InAppPurchaseState>(
          builder: (context, state) {
            return Scaffold(
              body: _buildUI(context, state),
            );
          },
        ),
      );
    }
  }

  Widget _buildUI(BuildContext context, InAppPurchaseState? state) {
    return Container(
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.height),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildAppBar(context),
          const SizedBox(
            height: 32,
          ),
          for (int i = 0; i < 3; i++) _buildItem(context, state, i),
          GestureDetector(
            onTap: () {
              if(_selectedIndex == 0) {
                return;
              }
              if (widget.paymentMethod == 'qr_payment') {
                _handlePayment(
                    step: widget.pricing?.step ?? 1,
                    price: _price,
                    pricePerClick: widget.pricing?.price_per_step ?? 0,
                    currency: widget.pricing?.currency ?? '',
                    context);
              } else {
                _handleInAppPayment(_selectedIndex - 1, state!);
              }
            },
            child: Container(
              margin: const EdgeInsets.only(left: 32, right: 32, bottom: 72),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 64),
              decoration: BoxDecoration(
                color: (_price) > 0
                    ? context.color.primary
                    : Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Text(
                'Pay',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32, left: 16, right: 32),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 28,
                  color: Colors.grey.withOpacity(0.8),
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 7.0),
            child: Center(
              child: Text(
                'Pricing',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, InAppPurchaseState? state, int index) {
    index++;
    int numClicks = (widget.pricing?.step ?? 0) * index;
    String price;
    if(widget.paymentMethod == 'qr_payment') {
      price = ((widget.pricing?.price_per_step ?? 0) * index).toString();
    } else {
      price = state!.products[index - 1].price;
    }
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 72),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFA690E3).withOpacity(1),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          Radio(
            value: index,
            groupValue: _selectedIndex,
            onChanged: (value) {
              setState(() {
                _selectedIndex = value!;
                _price = (widget.pricing?.step ?? 0) * index;
              });
            },
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return context.color.primary;
              }
              return Colors.white.withOpacity(0.8);
            }),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                '$numClicks clicks',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(1),
                ),
              ),
            ),
          ),
          Text(
            '${_handlePrice(price)} ${widget.pricing?.currency}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(1),
            ),
          )
        ],
      ),
    );
  }

  String _handlePrice(String price) {
    StringBuffer res = StringBuffer();
    int n = price.length;
    if (n <= 3) return price;
    int par = n % 3;
    for (int i = 0; i < par; i++) {
      res.write(price[i]);
    }
    par > 0 ? res.write(',') : res.write('');
    for (int i = par; i < n; i++) {
      if ((i - par) % 3 == 0 && i != par) {
        res.write(',');
      }
      res.write(price[i]);
    }

    return res.toString();
  }

  void _handlePayment(BuildContext context, {required int step, required int price, required int pricePerClick, required String currency}) async {
    _loadingOverlay.showLoadingOverlay(context);
    if (price > 0) {
      final data = await _qrPricingController!.createQr(price);
      _loadingOverlay.removeLoadingOverlay();
      if (context.mounted) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QRDisplayPage(
                    data, price * pricePerClick ~/ step, currency)));
      }
    }
  }

  void _handleInAppPayment(int index, InAppPurchaseState state) {
    _inAppPurchaseController!.buyProduct(state.products[index]);
  }
}
