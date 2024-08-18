import 'package:after_layout/after_layout.dart';
import 'package:photo_ai/features/widgets/app_icon_button_horizontal.dart';
import 'package:photo_ai/features/widgets/permission_req.dart';
import 'package:photo_ai/generated/index.dart';
import 'package:photo_ai/init/index.dart';
import '../../../generated/assets.dart';
import '../../../packages/index.dart';
import '../../index.dart';

class HomePage extends StatefulWidget {
  final bool checkNavigate;
  const HomePage({super.key, required this.checkNavigate});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  late HomeController _controller = HomeController();

  HomeController _createController(BuildContext context) {
    _controller = HomeController();
    return _controller;
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    if(widget.checkNavigate) {
      await _controller.checkPreviousImage(context: context);
      if (_controller.hasPreviousImage()) {
        if (context.mounted) {
          context.navigatePhotoEnhanceReplacement(
              pathFile: _controller.getPreviousImagePath()!);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocale.load(Localizations.localeOf(context));
    return BlocProvider(
      create: (context) => _createController(context),
      child: BlocBuilder<HomeController, HomeState>(builder: (context, state) {
        return Scaffold(
          backgroundColor: context.color.white,
          appBar: AppBarComponent(
            title: Container(
              margin: const EdgeInsets.only(right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.loc.common_search, style: context.heading5),
                  IconButton(
                    onPressed: () async {
                      if (context.mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClickManagementPage(
                                      countryCode: Config.countryCode,
                                    )));
                      }
                    },
                    icon: const Icon(
                      Icons.shopping_bag_rounded,
                      size: 32,
                      color: Color(0xFF9A81FA),
                    ),
                  ),
                ],
              ),
            ),
            leading: const SizedBox.shrink(),
            centerTitle: true,
          ),
          body: _buildUI(context),
          bottomNavigationBar: _buildBottomUI(context),
        );
      }),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      margin: EdgeInsets.all(context.padding16X),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: context.color.borderBorder,
        ),
        borderRadius: context.borderLarge,
      ),
      child: Stack(
        children: [
          const Positioned.fill(
            child: AppImage(
              asset: Assets.imgLaunch2,
              fit: BoxFit.fill,
              radius: 16,
            ),
          ),
          const Column(
            children: [
              AppImage(
                asset: Assets.imgLaunch,
                radius: 16,
              ),
            ],
          ),
          Positioned(
            bottom: context.padding64X,
            left: 0,
            right: 0,
            child: Column(
              children: [
                AppText(
                  context.loc.allow_access,
                  style: context.heading5,
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.padding8X),
                  child: AppText(
                    context.loc.to_your_photos,
                    style: context.heading5.copyWith(
                      color: context.color.primary,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.padding16X),
                  child: AppText(
                    context.loc.they_will_appear_here,
                    style: context.label4.copyWith(
                      color: context.color.textSubtitle,
                    ),
                  ),
                ),
                context.height16X,
                AppFilledButton(
                  onPressed: () async {
                    await PermissionReq.requestPhotoPermission(
                        context, context.navigatePhotoEnhanceReplacement);
                  },
                  child: AppText(
                    context.loc.allow_access,
                    style: context.button3.copyWith(
                      color: context.color.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomUI(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: kToolbarHeight,
      padding: EdgeInsets.symmetric(
        horizontal: context.padding16X,
        vertical: context.padding8X,
      ),
      decoration: BoxDecoration(
        color: context.color.backgroundWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: AppIconButtonHorizontal(
              title: context.loc.common_camera,
              icon: Assets.outlineCamera,
              iconColor: const Color(0xFFFE5F9D),
              onTapCallback: () async {
                await PermissionReq.requestCameraPermission(
                    context, context.navigatePhotoEnhance);
              },
            ),
          ),
          context.width16X,
          Expanded(
            child: AppIconButtonHorizontal(
                icon: Assets.outlineGallery,
                title: context.loc.common_gallery,
                iconColor: context.color.primary,
                onTapCallback: () async {
                  await PermissionReq.requestPhotoPermission(
                      context, context.navigatePhotoEnhanceReplacement);
                }),
          ),
        ],
      ),
    );
  }
}
