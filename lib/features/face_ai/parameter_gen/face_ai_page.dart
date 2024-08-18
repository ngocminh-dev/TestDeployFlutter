import 'package:photo_ai/generated/index.dart';

import '../../../generated/assets.dart';
import '../../../packages/index.dart';
import '../../index.dart';
import '../index.dart';

class FaceAiPage extends StatefulWidget {
  final String pathFile;
  final bool needUpload;

  const FaceAiPage(
      {super.key, required this.pathFile, required this.needUpload});

  @override
  State<FaceAiPage> createState() => _FaceAiPageState();
}

class _FaceAiPageState extends State<FaceAiPage> with TickerProviderStateMixin {
  late final FaceAiController _controller;
  int currentIndex = 0;
  late TabController _tabController;
  final _loadingOverlay =
      ElaboratedLoadingOverlay(url: Assets.loadingAILoading);

  FaceAiController _createController() {
    _controller = FaceAiController(widget.pathFile, widget.needUpload);
    return _controller;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(),
      child: BlocBuilder<FaceAiController, FaceAIState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBarComponent(
              title: AppText(
                context.loc.super_style,
                style: context.heading6,
              ),
              centerTitle: true,
            ),
            backgroundColor: context.color.white,
            body: _buildUI(context, state),
            bottomNavigationBar: _buildBottomUI(context, state),
            floatingActionButton:
                currentIndex == 0 ? _buildAdditionsFAB(context) : null,
          );
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context, FaceAIState state) {
    return Column(
      children: [
        _buildTabBar(context),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.padding16X,
                  vertical: context.padding8X,
                ),
                child: Column(
                  children: [
                    _buildAdditionsWidget(context, state),
                    const SizedBox(height: 8.0,),
                    Expanded(
                      child: _buildCategoryDisplay(context, state),
                    ),
                  ],
                ),
              ),
              // Container(),
              _buildImageGrid(context, state)
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.red,
      indicatorColor: Colors.purpleAccent.withOpacity(0.6),
      tabs: [
        Tab(
          child: AppImage(
              asset: Assets.iconText,
              width: 30,
              height: 30,
              color: currentIndex == 0
                  ? const Color(0xFFFE5F9D).withOpacity(0.8)
                  : Colors.grey,
            )
        ),
        Tab(
          child: AppImage(
            asset: Assets.iconEnhanceNormal,
            width: 30,
            height: 30,
            color: currentIndex == 1
                ? const Color(0xFFFE5F9D).withOpacity(0.8)
                : Colors.grey,
          )
        ),
      ],
    );
  }

  Widget _buildAdditionsFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _controller.enableAdditionField();
      },
      foregroundColor: Colors.white,
      backgroundColor: AppColor.primary,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }

  Widget _buildCategoryDisplay(BuildContext context, FaceAIState state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: List.generate(state.categories.length, (index) {
              var item = state.categories[index];
              return _buildLineItems(
                context,
                title: item.name ?? '',
                traits: item.traits,
                categoryIndex: index,
              );
            }).toList(),
          ),
          // _buildAdditionsWidget(context),
        ],
      ),
    );
  }

  Widget _buildBottomUI(BuildContext context, FaceAIState state) {
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
        onPressed: _handleOnPressed(context, state),
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

  void Function()? _handleOnPressed(BuildContext context, FaceAIState state) {
    final textOnPress = state.generateEnableText
        ? () async {
            bool check = await _controller.checkClicks(context);
            if (check && context.mounted) {
              _handleGenText(context, state);
            }
          }
        : null;
    final imageOnPress = state.generateEnableImage
        ? () async {
            bool check = await _controller.checkClicks(context);
            if (check && context.mounted) {
              _handleGenImage(context, state);
            }
          }
        : null;
    if (currentIndex == 0) {
      return textOnPress;
    } else {
      return imageOnPress;
    }
  }

  Widget _buildLineItems(
    BuildContext context, {
    required String title,
    required List<TraitDto> traits,
    required int categoryIndex,
  }) {
    return Container(
      width: context.width,
      padding: EdgeInsets.only(top: context.padding20X),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title.convertFirstCapitalize(),
            style: context.heading6,
          ),
          Padding(
            padding: EdgeInsets.only(top: context.padding16X),
            child: Wrap(
              key: const Key('value'),
              runSpacing: 12,
              spacing: 16,
              children: List.generate(traits.length, (index) {
                var trait = traits[index];
                return _buildItemCategory(
                  context,
                  trait: trait,
                  categoryIndex: categoryIndex,
                  traitIndex: index,
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemCategory(
    BuildContext context, {
    required TraitDto trait,
    required int categoryIndex,
    required int traitIndex,
  }) {
    return YdInkWell(
      borderRadius: context.borderMaxLarge,
      onTap: () {
        _controller.updateTrait(
          trait: trait,
          categoryIndex: categoryIndex,
          traitIndex: traitIndex,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.padding4X,
          horizontal: context.padding16X,
        ),
        decoration: BoxDecoration(
          color: trait.selected
              ? context.color.alertInfo
              : context.color.backgroundLight2,
          borderRadius: context.borderMaxLarge,
        ),
        child: AppText(
          trait.name ?? '',
          style: context.heading8.copyWith(
            color:
                trait.selected ? context.color.white : context.color.alertInfo,
          ),
        ),
      ),
    );
  }

  Widget _buildAdditionsWidget(BuildContext context, FaceAIState state) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: SizedBox(
        height: state.enableAdditions ? null : 0,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TextField(
            style: context.heading8,
            controller: _controller.getTextController(),
            maxLines: null,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: state.enableAdditions ? Colors.grey : Colors.white,
                    width: 1.5),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.blueAccent, width: 1.5),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageGrid(BuildContext context, FaceAIState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
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
        ),
      ],
    );
  }

  Widget _buildIndividualImage(BuildContext context, FaceAIState state,
      String imageUrl, int index, Animation<double> animation) {
    final borderRadius = BorderRadius.circular(10);
    final selectedBorder = BoxDecoration(
        color: context.color.primary,
        borderRadius: borderRadius,
        border: Border.all(width: 2, color: context.color.primary));
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

  Widget _buildProcessIndicator(BuildContext context, FaceAIState state) {
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

  void _handleGenText(BuildContext context, FaceAIState state) async {
    _loadingOverlay.showLoadingOverlay(context);
    _controller.generateByText(context: context, (images) async {
      if (context.mounted) {
        _loadingOverlay.removeLoadingOverlay();
        if(images.isNotEmpty) {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AIGenResultPage(
                    images: images,
                    regenerateFunction: _controller.generateByText,
                  ),
            ),
          ).then((value) {
            _controller.updateReRender();
          });
        } else {
          ShowToastController.showToast(context,
              type: 'Error',
              message:
              context.loc.overloaded_error);
        }
      }
    });
  }

  void _handleGenImage(BuildContext context, FaceAIState state) async {
    _loadingOverlay.showLoadingOverlay(context);
    _controller.generateByImage(context: context, (images) async {
      if (context.mounted) {
        _loadingOverlay.removeLoadingOverlay();
        if(images.isNotEmpty) {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AIGenResultPage(
                      images: images,
                      regenerateFunction: _controller.generateByImage,
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
