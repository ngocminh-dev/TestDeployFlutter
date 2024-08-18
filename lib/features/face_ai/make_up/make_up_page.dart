import 'package:photo_ai/generated/assets.dart';
import 'package:photo_ai/generated/index.dart';

import '../../../packages/index.dart';
import '../../index.dart';
import '../index.dart';

class MakeUpPage extends StatefulWidget {
  final String pathFile;
  final bool needUpload;

  const MakeUpPage({super.key, required this.pathFile, required this.needUpload});

  @override
  State<MakeUpPage> createState() => _MakeUpPageState();
}

class _MakeUpPageState extends State<MakeUpPage> {
  late final MakeUpController _controller;
  final _loadingOverlay = ElaboratedLoadingOverlay(url: Assets.loadingAILoading);

  MakeUpController _createController() {
    _controller = MakeUpController(widget.pathFile, widget.needUpload);
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(),
      child: BlocBuilder<MakeUpController, MakeUpState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBarComponent(
              title: AppText(
                context.loc.make_up,
                style: context.heading6,
              ),
              centerTitle: true,
            ),
            backgroundColor: context.color.white,
            body: _buildUI(context, state),
            floatingActionButton: _buildImageUploadFAB(context, state),
            bottomNavigationBar: _buildBottomUI(context, state),
          );
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context, MakeUpState state) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.padding6X,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildImageGrid(context, state),
          ]),
    );
  }

  Widget _buildBottomUI(BuildContext context, MakeUpState state) {
    return Container(
      alignment: Alignment.center,
      height: kToolbarHeight,
      width: context.width,
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
      child: AppFilledButton.withIcon(
        onPressed: state.generateEnabled
            ? () async {
          bool check = await _controller.checkClicks(
              context);
          if (check && context.mounted) {
            _handleGen(context, state);
          }
        }
            : null,
        label: AppText(
          context.loc.face_ai_generate,
          style: context.button3.copyWith(color: context.color.white),
        ),
        prefixIcon: const AppImage(
          asset: Assets.iconGenerate,
          width: 24,
          height: 24,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildImageGrid(BuildContext context, MakeUpState state) {
    return Expanded(
      child: AnimatedGrid(
        key: _controller.gridKey,
        initialItemCount: state.images.length + 1,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1),
        itemBuilder: (context, index, animation) {
          if (index == state.images.length) {
            return _buildProcessIndicator(context, state);
          } else {
            return _buildIndividualImage(
                context,
                state,
                state.images[index % state.images.length],
                index % state.images.length,
                animation);
          }
        },
        controller: _controller.getScrollController(),
      ),
    );
  }

  Widget _buildIndividualImage(BuildContext context, MakeUpState state,
      String imageUrl, int index, Animation<double> animation) {
    final borderRadius = BorderRadius.circular(10);
    final selectedBorder = BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: borderRadius,
        border: Border.all(width: 2, color: context.colorScheme.primary));
    final normalBorder =
    BoxDecoration(color: Colors.white, borderRadius: borderRadius);
    return ScaleTransition(
      key: UniqueKey(),
      scale: CurvedAnimation(parent: animation, curve: Curves.bounceOut),
      child: GestureDetector(
        onTap: () {
          _controller.selectImage(index);
        },
        child: Container(
          padding: EdgeInsets.all(context.padding2X),
          decoration:
          state.selectedIndex == index ? selectedBorder : normalBorder,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: SizedBox.fromSize(
              size: const Size.fromRadius(40),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProcessIndicator(BuildContext context, MakeUpState state) {
    return Padding(
      padding: EdgeInsets.all(context.padding8X),
      child: Center(
        child: Opacity(
          opacity: state.loading ? 1.0 : 00,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildImageUploadFAB(BuildContext context, MakeUpState state) {
    return FloatingActionButton(
      onPressed: () async {
        bool picked = await _controller.pickUploadImage(context);
        if (context.mounted && picked) {
          _handleGen(context, state);
        }
      },
      foregroundColor: Colors.white,
      backgroundColor: AppColor.primary,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }

  void _handleGen(BuildContext context, MakeUpState state) async {
    _loadingOverlay.showLoadingOverlay(context);
    _controller.generate(context: context, (images) async {
      if (context.mounted) {
        _loadingOverlay.removeLoadingOverlay();
        if(images.isNotEmpty) {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AIGenResultPage(
                      images: images,
                    ),
              ));
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
