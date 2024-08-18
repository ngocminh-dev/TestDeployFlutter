import 'dart:typed_data';

import 'package:after_layout/after_layout.dart';
import 'package:photo_ai/features/access_photo/photo_gallery/photo_gallery_controller.dart';
import 'package:photo_ai/features/access_photo/photo_gallery/photo_gallery_state.dart';
import 'package:photo_ai/generated/extension.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../packages/index.dart';

class PhotoGallery extends StatefulWidget {
  final void Function({required String pathFile}) navigateFunction;
  final bool? temporaryImage;
  const PhotoGallery({super.key, required this.navigateFunction, this.temporaryImage});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> with AfterLayoutMixin<PhotoGallery>,TickerProviderStateMixin {
  late final PhotoGalleryController _controller;

  PhotoGalleryController _createController() {
    _controller = PhotoGalleryController(widget.navigateFunction, temporaryImage: widget.temporaryImage, vsync: this);
    return _controller;
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await _controller.fetchAssets();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(),
      child: BlocBuilder<PhotoGalleryController, PhotoGalleryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
                title: const Text(
                  'Select your photo',
                  style: TextStyle(fontSize: 18),
                ),
            ),
            body: _buildUI(context, state),
          );
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context, PhotoGalleryState state) {
    return Column(
      children: [
        _buildTabBar(context),
        _buildLinearProgressIndicator(context, state),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TabBarView(
                controller: _controller.tabController,
                children: [
                  _buildImageGridAllImages(context, state),
                  _buildImageGridFaceImages(context, state),
                ],
              ),
            ),
        )
      ],
    );
  }

  Widget _buildLinearProgressIndicator(BuildContext context, PhotoGalleryState state) {
    if(state.progress == 0 || state.progress == 1) {
      return const SizedBox(height: 1.5,);
    }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: LinearProgressIndicator(
          color: context.color.primary,
          minHeight: 1.5,
          value: state.progress,
        ),
      );
  }

  Widget _buildImageGridAllImages(BuildContext context, PhotoGalleryState state) {
    return GridView.builder(
      itemCount: state.allAssets.length,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1),
      itemBuilder: (context, index) {
        return _buildCommonIndividualImage(context, state, state.allAssets[index], index);
      },
    );
  }

  Widget _buildImageGridFaceImages(BuildContext context, PhotoGalleryState state) {
    return GridView.builder(
      itemCount: state.faceAssets.length,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1),
      itemBuilder: (context, index) {
        return _buildCommonIndividualImage(context, state, state.faceAssets[index], index);
      },
    );
  }

  Widget _buildCommonIndividualImage(BuildContext context, PhotoGalleryState state, AssetEntity asset, int index) {
    final borderRadius = BorderRadius.circular(10);
    return FutureBuilder<Uint8List>(
      future: asset.thumbnailData.then((value) => value!),
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if(bytes == null) return _buildProcessIndicator(context, state);
        return GestureDetector(
          onTap: () {
            if(state.currentIndex == 0) {
              _controller.pickFromAllAssets(context, index);
            } else if(state.currentIndex == 1){
              _controller.pickFromFaceAssets(context, index);
            }
          },
          child: Container(
            padding: EdgeInsets.all(context.padding2X),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: SizedBox.fromSize(
                size: const Size.fromRadius(40),
                child: Image.memory(bytes, fit: BoxFit.cover, gaplessPlayback: true),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProcessIndicator(BuildContext context, PhotoGalleryState state) {
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

  Widget _buildTabBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.grey[300],
          ),
          child: TabBar(
            controller: _controller.tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black54,
            tabs: [
              _buildTabItem(context.loc.all, context),
              _buildTabItem(context.loc.faces, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
