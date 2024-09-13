import 'package:photo_ai/generated/index.dart';
import 'package:photo_ai/init/index.dart';

import '../../../generated/assets.dart';
import '../../../packages/index.dart';
import '../../index.dart';
import '../../widgets/permission_req.dart';
import '../index.dart';

class RealStylePage extends StatefulWidget {
  final String pathFile;
  final bool needUpload;

  const RealStylePage(
      {super.key, required this.pathFile, required this.needUpload});

  @override
  State<RealStylePage> createState() => _RealStylePageState();
}

class _RealStylePageState extends State<RealStylePage> {
  late final RealStyleController _controller;
  final _loadingOverlay =
  ElaboratedLoadingOverlay(url: Assets.loadingAILoading);
  List<bool> isSlided = List.generate(100, (index) => false);
  RealStyleController _createController() {
    _controller = RealStyleController(widget.pathFile, widget.needUpload);
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(),
      child: BlocBuilder<RealStyleController, RealStyleState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                _buildAppBar(context),
                Expanded(child: _buildUI(context, state))
              ],
            ),
            bottomNavigationBar: _buildBottomUI(context, state),
          );
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32, left: 8, right: 16),
      child: Stack(
        children: [
          Positioned(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 28,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    await PermissionReq.requestPhotoPermission(
                        context, context.navigateRealStyleReplacement,
                        temporaryImage: true);
                  },
                  child: AppImage(
                    asset: Assets.iconFaceImagePick,
                    width: 32,
                    height: 32,
                    color: context.color.primary,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Text(
                context.loc.real_style,
                style: const TextStyle(
                  fontSize: 20,
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

  Widget _buildUI(BuildContext context, RealStyleState state) {
    if (state.loading) {
      return const YDLazyLoadingWidget();
    }
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: context.padding16X,
        vertical: context.padding16X,
      ),
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
                indexCateString: item.id,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomUI(BuildContext context, RealStyleState state) {
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
        onPressed: state.generateEnable
            ? () async {
          bool check = await _controller.checkClicks(context);
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

  Widget _buildLineItems(
      BuildContext context, {
        required String title,
        required List<TraitDto> traits,
        required int categoryIndex,
        required String? indexCateString,
      }) {
    return Container(
      width: context.width,
      padding: EdgeInsets.only(bottom: context.padding20X),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                title.convertFirstCapitalize(),
                style: context.heading6,
              ),
            ],
          ),
          const SizedBox(height: 7,),
          if(title.convertFirstCapitalize() != 'Sexy')
            _buildAdditionsWidget(context, categoryId: indexCateString, categoryIndex: categoryIndex),
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

  Widget _buildAdditionsWidget(
      BuildContext context, {required String? categoryId, required int categoryIndex}) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSlided[categoryIndex] = true;
                });
              },
              icon: const Icon(
                Icons.add_circle,
                color: Colors.blueAccent,
              )),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: !isSlided[categoryIndex]
                ? 0
                : MediaQuery.of(context).size.width - 90,
            color: Colors.transparent,
            child: Visibility(
              visible: isSlided[categoryIndex],
              child: TextField(
                style: context.heading8,
                maxLines: 1,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.blueAccent, width: 1.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value) {
                  _controller.updateAdditions(categoryId, value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleGen(BuildContext context, RealStyleState state) async {
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
}
