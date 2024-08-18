import 'package:after_layout/after_layout.dart';
import 'package:photo_ai/features/face_ai/index.dart';
import 'package:photo_ai/generated/index.dart';
import 'package:photo_ai/init/index.dart';
import '../../../packages/index.dart';
import '../../index.dart';
import '../../../generated/assets.dart';

class PhotoEnhancePage extends StatefulWidget {
  final String filePath;

  const PhotoEnhancePage({super.key, required this.filePath});

  @override
  State<PhotoEnhancePage> createState() => _PhotoEnhancePageState();
}

class _PhotoEnhancePageState extends State<PhotoEnhancePage>
    with AfterLayoutMixin<PhotoEnhancePage> {
  late final PhotoEnhanceController _controller;
  final _loadingOverlay =
      ElaboratedLoadingOverlay(url: Assets.loadingAILoading);

  PhotoEnhanceController _createController() {
    _controller = PhotoEnhanceController(widget.filePath);
    return _controller;
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    _controller.checkHasFace(widget.filePath, context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(),
      child: BlocBuilder<PhotoEnhanceController, PhotoEnhanceState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [_buildAppBar(context), _buildUI(context)],
            ),
            bottomNavigationBar: _buildBottomUI(context, state),
          );
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32, left: 16, right: 8),
      child: Stack(
        children: [
          Positioned(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    context.navigateHome(checkNavigate: false);
                  },
                  child: AppImage(
                    asset: Assets.iconFaceImagePick,
                    width: 32,
                    height: 32,
                    color: context.color.primary,
                  ),
                ),
                const Spacer(),
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
          Positioned.fill(
            child: Center(
              child: Text(
                context.loc.enhance_topbar_title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: AppImage(
                asset: widget.filePath,
                inStorage: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomUI(BuildContext context, PhotoEnhanceState state) {
    return Container(
        alignment: Alignment.center,
        height: 80,
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIconButtonVertical(
                onTapCallback: () async {
                  bool check = await _controller.checkClicks(context);
                  if (check && context.mounted) {
                    _handleEnhance(context, isNormal: true);
                  }
                },
                title: context.loc.normal_enhance,
                icon: Assets.iconEnhanceNormal,
              ),
              context.width16X,
              if (state.hasFace)
                Row(children: [
                  AppIconButtonVertical(
                    onTapCallback: () async {
                      bool check = await _controller.checkClicks(context);
                      if (check && context.mounted) {
                        _handleEnhance(context, isNormal: false);
                      }
                    },
                    title: context.loc.super_enhance,
                    icon: Assets.iconEnhanceSuper,
                  ),
                  context.width16X,
                  AppIconButtonVertical(
                    icon: Assets.outlineMagicpen,
                    title: context.loc.super_style,
                    onTapCallback: () async {
                      bool check = await _controller.checkClicks(context);
                      if (check && context.mounted) {
                        _navigateFaceAI(context);
                      }
                    },
                  ),
                  context.width16X,
                  AppIconButtonVertical(
                    title: context.loc.real_style,
                    icon: Assets.iconRealStyleSvg,
                    onTapCallback: () async {
                      bool check = await _controller.checkClicks(context);
                      if (check && context.mounted) {
                        _navigateRealStyle(context);
                      }
                    },
                  ),
                  context.width16X,
                  AppIconButtonVertical(
                      title: context.loc.photo_swap,
                      icon: Assets.iconFaceSwap,
                      onTapCallback: () async {
                        bool check = await _controller.checkClicks(context);
                        if (check && context.mounted) {
                          _navigateImageGen(context);
                        }
                      }),
                  context.width16X,
                  AppIconButtonVertical(
                      title: context.loc.make_up,
                      icon: Assets.iconMakeUp,
                      onTapCallback: () async {
                        bool check = await _controller.checkClicks(context);
                        if (check && context.mounted) {
                          _navigateMakeUp(context);
                        }
                      }),
                  context.width16X,
                  AppIconButtonVertical(
                    onTapCallback: () async {
                      bool check = await _controller.checkClicks(context);
                      if (check && context.mounted) {
                        _navigateMagicBrush(context);
                      }
                    },
                    title: context.loc.magic_brush,
                    icon: Assets.iconMagicBrush,
                  ),
                  context.width16X,
                ]),
              AppIconButtonVertical(
                icon: Assets.iconRemoveBackground,
                title: context.loc.remove_background,
                onTapCallback: () async {
                  final Uri url = Uri.parse('https://www.remove.bg');
                  if (!await launchUrl(url,
                          mode: LaunchMode.externalApplication) &&
                      context.mounted) {
                    ShowToastController.showToast(context,
                        type: 'Error',
                        message:
                            context.loc.error_msg);
                  }
                },
              ),
              context.width16X,
            ],
          ),
        ));
  }

  void _navigateFaceAI(BuildContext context) {
    String needUpload =
        _controller.pathFile == widget.filePath ? 'true' : 'false';
    context.navigateAIFace(
        pathFile: _controller.pathFile, needUpload: needUpload);
  }

  void _navigateImageGen(BuildContext context) {
    String needUpload =
        _controller.pathFile == widget.filePath ? 'true' : 'false';
    context.navigateImageGenPage(
        pathFile: _controller.pathFile, needUpload: needUpload);
  }

  void _navigateMakeUp(BuildContext context) {
    String needUpload =
    _controller.pathFile == widget.filePath ? 'true' : 'false';
    context.navigateMakeUpPage(
        pathFile: _controller.pathFile, needUpload: needUpload);
  }

  void _navigateRealStyle(BuildContext context) {
    String needUpload =
        _controller.pathFile == widget.filePath ? 'true' : 'false';
    context.navigateRealStyle(
        pathFile: _controller.pathFile, needUpload: needUpload);
  }

  void _navigateMagicBrush(BuildContext context) {
    String needUpload =
    _controller.pathFile == widget.filePath ? 'true' : 'false';
    context.navigateMagicBrushPage(
         pathFile: _controller.pathFile, needUpload: '');
  }

  void _handleEnhance(BuildContext context, {required bool isNormal}) async {
    _loadingOverlay.showLoadingOverlay(context);
    _controller.generate((images) async {
      if (context.mounted) {
        _loadingOverlay.removeLoadingOverlay();
        if (images.isNotEmpty) {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AIGenResultPage(
                images: images,
              ),
            ),
          );
        } else {
          ShowToastController.showToast(context,
              type: 'Error',
              message:
                  context.loc.overloaded_error);
        }
      }
    }, isNormal: isNormal);
  }
}
