import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:photo_ai/features/face_ai/index.dart';
import 'package:photo_ai/features/widgets/circular_app_icon_button.dart';
import 'package:photo_ai/features/widgets/elaborated_loading_overlay.dart';
import 'package:photo_ai/generated/assets.dart';
import 'package:photo_ai/generated/extension.dart';

import '../../../packages/index.dart';
import '../../showToast/show_toast_controller.dart';
import '../../widgets/app_bar_component.dart';

class AIGenResultPage extends StatefulWidget {
  final List<String> images;
  final Future<void> Function(void Function(List<String> images) callback,
      {required BuildContext context})? regenerateFunction;
  final bool canEnhance;

  const AIGenResultPage(
      {super.key, required this.images, this.regenerateFunction,  this.canEnhance = false});

  @override
  State<AIGenResultPage> createState() => _AIGenResultPageState();
}

class _AIGenResultPageState extends State<AIGenResultPage> {
  late AIGenResultController _controller;
  final FlutterShareMe flutterShareMe = FlutterShareMe();
  final _loadingOverlay =
      ElaboratedLoadingOverlay(url: Assets.loadingAILoading);

  AIGenResultController _createController(List<String> images) {
    _controller = AIGenResultController(images);
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(widget.images),
      child: BlocBuilder<AIGenResultController, AIGenResultState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.color.white,
            appBar: AppBarComponent(
              title: AppText(
                context.loc.ai_gen_result,
                style: context.heading6,
              ),
              centerTitle: true,
            ),
            body: _buildUI(context, state),
          );
        },
      ),
    );
  }

  Widget _buildFunctionButtons(BuildContext context, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if(widget.canEnhance)
              CircularAppIconButton(
                onTapCallback: () {
                  _handleEnhance(context);
                },
                icon: Assets.iconEnhanceSuper,
              ),
            if (widget.regenerateFunction != null)
              CircularAppIconButton(
                onTapCallback: () async {
                  await _handleRegen(context);
                },
                icon: Assets.iconRegenerate,
              ),
            CircularAppIconButton(
              onTapCallback: () {
                _controller.saveNetworkImage(imageUrl);
              },
              icon: Assets.iconDownload,
            ),
            CircularAppIconButton(
              onTapCallback: () async {
                Uri.parse(imageUrl);
                final response = await Dio().get(imageUrl,
                    options: Options(responseType: ResponseType.bytes));
                await Share.shareXFiles([
                  XFile.fromData(Uint8List.fromList(response.data),
                      name: 'Shared image', mimeType: 'image/png')
                ], subject: 'Shared image');
              },
              icon: Assets.iconShare,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleRegen(BuildContext context) async {
    callback(images) {
      _loadingOverlay.removeLoadingOverlay();
      if(images.isNotEmpty) {
        _controller.updateImageUrls(images);
      } else {
        ShowToastController.showToast(context,
            type: 'Error',
            message:
            context.loc.overloaded_error);
      }
    }

    bool check = await _controller.checkClicks(context);
    if (check && context.mounted) {
      _loadingOverlay.showLoadingOverlay(context);
      await widget.regenerateFunction!(callback, context: context);
    }
  }

  Widget _buildUI(BuildContext context, AIGenResultState state) {
    List<String> images = state.images;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: context.color.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: images.length > 1
              ? _buildCarouselSlider(images)
              : _buildSingleImage(images[0], context),
        ),
        _buildDotsIndicator(state.currentIndex, images.length),
        _buildFunctionButtons(context, images[state.currentIndex]),
      ],
    );
  }

  Widget _buildCarouselSlider(List<String> images) {
    return cs.CarouselSlider(
      key: _controller.carouselKey,
      options: cs.CarouselOptions(
          height: context.height - 200,
          enableInfiniteScroll: true,
          initialPage: 0,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            _controller.updateCurrentIndex(index: index);
          }),
      items: images.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return _buildSingleImage(imageUrl, context);
          },
        );
      }).toList());
  }

  Widget _buildSingleImage(String imageUrl, BuildContext context) {
    return InteractiveViewer(
      panEnabled: false,
      minScale: 0.25,
      maxScale: 4,
      child: Container(
        width: context.width,
        height: context.height-250,
        margin: const EdgeInsets.symmetric(horizontal: 3.0),
        decoration: BoxDecoration(
          color: context.color.white,
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              imageUrl,
            ),
          ),
        )
      ),
    );
  }

  Widget _buildDotsIndicator(int currentIndex, int dotsCount) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: currentIndex,
    );
  }

  void _handleEnhance(BuildContext context) async {
    _loadingOverlay.showLoadingOverlay(context);
    _controller.enhance((images) async {
      if (context.mounted) {
        _loadingOverlay.removeLoadingOverlay();
        if (images.isNotEmpty) {
          _controller.updateImageUrls(images);
        } else {
          ShowToastController.showToast(context,
              type: 'Error',
              message:
              context.loc.overloaded_error);
        }
      }
    });
  }
}
