import 'package:after_layout/after_layout.dart';
import 'package:photo_ai/generated/assets.dart';
import 'package:photo_ai/generated/extension.dart';
import 'package:photo_ai/packages/lib_manager/index.dart';

import '../../packages/index.dart';

import '../index.dart';

class ClickManagementPage extends StatefulWidget {
  final String? countryCode;

  const ClickManagementPage({super.key, required this.countryCode});

  @override
  State<ClickManagementPage> createState() => _ClickManagementPageState();
}

class _ClickManagementPageState extends State<ClickManagementPage>
    with AfterLayoutMixin<ClickManagementPage> {
  late ClickController _controller;
  final _normalLoadingOverlay =
      ElaboratedLoadingOverlay(url: Assets.loadingNormalLoading);
  final _paymentLoadingOverlay =
      ElaboratedLoadingOverlay(url: Assets.loadingPaymentLoading);

  ClickController createController() {
    _controller = ClickController(clicks: 0);
    return _controller;
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    _normalLoadingOverlay.showLoadingOverlay(context);
    await _controller.getNumberOfClicks();
    _normalLoadingOverlay.removeLoadingOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createController(),
      child: BlocBuilder<ClickController, ClickState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                _buildDescriptionBanner(context),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildClickRemained(state),
                        const SizedBox(
                          height: 24,
                        ),
                        _buildPaymentButtonsTab(context),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaymentButtonsTab(BuildContext context) {
    return Column(
      children: [
        if (widget.countryCode == 'VN')
          _buildPaymentButton(context, onTap: () {
            _handlePricing(context, 'qr_payment');
          },
              logoDecoration: Container(
                width: 120,
                height: 24,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(Assets.iconVietqr),
                )),
              )),
        _buildPaymentButton(
          context,
          onTap: () {
            _handlePricing(context, 'in_app_payment');
          },
          logoDecoration: Container(
            margin: const EdgeInsets.only(left: 14),
            height: 24,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'BUY',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend',
                  color: Color(0xFF233C88),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildExitButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 36, left: 16),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Icon(
          Icons.close_sharp,
          size: 28,
          color: Colors.white.withOpacity(0.6),
        ),
      ),
    );
  }

  Widget _buildAppLogoAndName() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(Assets.iconAiLogo),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          context.loc.app_name.toUpperCase(),
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend',
              color: Colors.white.withOpacity(0.96)),
        ),
      ],
    );
  }

  Widget _buildDescription(String description) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_sharp,
              size: 28,
              color: Colors.white.withOpacity(0.8),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Lexend',
                color: Colors.white.withOpacity(0.8),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildDescriptionBanner(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 360,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFcd9cf2).withOpacity(0.9),
          const Color(0xFF7028e4).withOpacity(0.8),
        ],
      )),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildExitButton(context),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildAppLogoAndName(),
                const SizedBox(
                  height: 14,
                ),
                _buildDescription('A very nice description'),
                _buildDescription('A very nice description'),
                _buildDescription('A very nice description'),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildPaymentButton(BuildContext context,
      {required GestureTapCallback onTap, required Widget logoDecoration}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, right: 18, left: 6),
        margin: const EdgeInsets.only(left: 48, right: 48, bottom: 48),
        decoration: BoxDecoration(
          color: const Color(0xFFE0D8FF).withOpacity(1),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            logoDecoration,
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildClickRemained(ClickState state) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 12,
            ),
            Text(
              '${state.click}',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000).withOpacity(0.9),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.iconClick),
                      fit: BoxFit.contain)),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 0),
          child: Text(
            context.loc.clicks_remained,
            style: TextStyle(
              color: const Color(0xFF9E85FF).withOpacity(0.9),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend',
            ),
          ),
        )
      ]),
    );
  }

  void _handlePricing(BuildContext context, String paymentForm) async {
    _paymentLoadingOverlay.showLoadingOverlay(context);
    var data = await _controller.getPricing();
    _paymentLoadingOverlay.removeLoadingOverlay();
    if (context.mounted) {
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PricingPage(data, paymentForm)))
          .then((value) async {
        _paymentLoadingOverlay.showLoadingOverlay(context);
        final response = await _controller.getNumberOfClicks();
        if (response != null) {
          _paymentLoadingOverlay.removeLoadingOverlay();
        }
      });
    }
  }
}
