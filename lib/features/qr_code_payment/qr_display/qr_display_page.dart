import 'package:photo_ai/features/index.dart';
import 'package:photo_ai/generated/index.dart';

import '../../../packages/index.dart';

class QRDisplayPage extends StatefulWidget {
  final PaymentDto? paymentInfo;
  final int price;
  final String currency;

  const QRDisplayPage(this.paymentInfo, this.price, this.currency, {super.key});

  @override
  State<QRDisplayPage> createState() => _QRDisplayPageState();
}

class _QRDisplayPageState extends State<QRDisplayPage> {
  late final QrDisplayController _controller;
  QrDisplayController _createController() {
    _controller = QrDisplayController(widget.paymentInfo);
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(),
      child: BlocBuilder<QrDisplayController, QrDisplayState>(
        builder: (context, state) {
          _controller.checkPaymentStatusPeriodically(
              state.paymentInfo?.order_id ?? '');
          if (state.status?.status == 'FAILED') {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ShowToastController.showToast(context, type: 'Warning',
                  message: context.loc.QR_expired_message);
            });
          } else if (state.status?.status == 'COMPLETED') {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ShowToastController.showToast(
                context,
                type: 'Successfully',
                message: context.loc.QR_success_message,
              );
            });
          }
          return Scaffold(
            body: _buildUI(context, state),
          );
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context, QrDisplayState state) {
    return Container(
      decoration:
          BoxDecoration(color: const Color(0xFFFFFFFF).withOpacity(0.95)),
      child: Column(
        children: [
          _buildAppBar(context),
          const SizedBox(
            height: 12,
          ),
          _buildMoneyDisplay(context),
          Expanded(child: Center(child: _buildQRDisplay(state))),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32, left: 16, right: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              _controller.stopTimer();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey.withOpacity(0.9),
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoneyDisplay(BuildContext context) {
    return Column(children: [
      Text(
        context.loc.payment_amount,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333).withOpacity(0.8),
            fontFamily: 'Lexend',
            letterSpacing: 1.6),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 14),
        child: Text(
          '${_handlePrice(widget.price.toString())} VNĐ',
          style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF000000).withOpacity(0.9),
              fontFamily: 'Lexend',
              letterSpacing: 1.6),
        ),
      ),
    ]);
  }

  Widget _buildQRDisplay(QrDisplayState state) {
    return Container(
      width: 450,
      height: 450,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                state.paymentInfo?.qr_image_link ?? '',
              ),
              fit: BoxFit.contain)),
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
}
