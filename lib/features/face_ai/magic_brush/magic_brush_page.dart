import 'dart:async';
import 'dart:typed_data';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_ai/features/face_ai/ai_gen_result/ai_gen_result_page.dart';
import 'package:photo_ai/generated/index.dart';
import 'package:painter/painter.dart';
import '../../../generated/assets.dart';
import '../../../packages/index.dart';
import '../../index.dart';
import 'magic_brush_controller.dart';
import 'magic_brush_state.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;

class MagicBrushPage extends StatefulWidget {
  final String filePath;
  final bool needUpload;
  const MagicBrushPage(
      {super.key, required this.filePath, required this.needUpload});

  @override
  State<MagicBrushPage> createState() => _MagicBrushPageState();
}

class _MagicBrushPageState extends State<MagicBrushPage>
    with AfterLayoutMixin<MagicBrushPage> {
  late final MagicBrushController _controller;
  final _loadingOverlay =
      ElaboratedLoadingOverlay(url: Assets.loadingAILoading);
  final GlobalKey _imageKeySegmentation = GlobalKey();
  final PainterController _painterController = PainterController();
  final ScreenshotController screenshotController = ScreenshotController();
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  MagicBrushController _createController() {
    _controller = MagicBrushController(widget.filePath, widget.needUpload);
    return _controller;
  }

  @override
  void initState() {
    _painterController.backgroundColor = Colors.transparent;
    _painterController.drawColor = Colors.white60;
    _painterController.thickness = 18.0;
    super.initState();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    // if(widget.checkNavigate) {
    //   await _controller.checkPreviousImage(context: context);
    //   if (_controller.hasPreviousImage()) {
    //     if (context.mounted) {
    //       context.navigateMagicBrushReplacement(
    //           pathFile: _controller.getPreviousImagePath()!);
    //     }
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(),
      child: BlocBuilder<MagicBrushController, MagicBrushState>(
          builder: (context, state) {
        return Scaffold(
          backgroundColor: context.color.white,
          appBar: AppBarComponent(
            title: AppText(
              context.loc.magic_brush,
              style: context.heading6,
            ),
            centerTitle: true,
          ),
          body: _buildUI(context, state),
          bottomNavigationBar: _buildBottomUI(context),
        );
      }),
    );
  }

  Widget _buildUI(BuildContext context, MagicBrushState state) {
    return Stack(children: [
      Center(
        child: Stack(
          children: [
            Image.network(widget.filePath),
            Positioned.fill(
                child: RepaintBoundary(
                    key: _imageKeySegmentation,
                    child: Painter(_painterController))),
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  controller: textController,
                  style: context.heading8,
                  maxLines: null,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    contentPadding: const EdgeInsets.all(15.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blueAccent, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: AppFilledButton.withIcon(
                onPressed: () async {
                  if (textController.text == '') {
                    ShowToastController.showToast(context,
                        type: 'Error', message: context.loc.no_prompt_error);
                  } else {
                    _initPrompt();
                    try {
                      await _initSegment();
                    } catch (e) {
                      // Xử lý lỗi nếu có
                      print('Lỗi khi lấy URL từ Firebase: $e');
                    }
                    _handleGen(context, state);
                  }
                },
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
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _buildBottomUI(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _bottomBatItem(Icons.undo, onPress: () {
                setState(() {
                  if (_painterController.isEmpty) {
                  } else {
                    _painterController.undo();
                  }
                });
              }),
            ),
            slider(
                value: _painterController.thickness,
                onChanged: (value) {
                  setState(() {
                    _painterController.thickness = value;
                  });
                }),
            Expanded(
              child: _bottomBatItem(Icons.delete, onPress: () {
                setState(() {
                  _painterController.clear();
                });
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomBatItem(IconData icon, {required onPress}) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  void _handleGen(BuildContext context, MagicBrushState state) async {
    _loadingOverlay.showLoadingOverlay(context);
    if (mounted) {
      _controller.generate(context: context, (images) async {
        if (context.mounted) {
          _loadingOverlay.removeLoadingOverlay();
          if (images.isNotEmpty) {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AIGenResultPage(
                    images: images,
                  ),
                ));
          } else {
            ShowToastController.showToast(context,
                type: 'Error', message: context.loc.overloaded_error);
          }
        }
      });
    }
  }

  Widget slider({value, onChanged}) {
    return Slider(
      label: '${value.toStringAsFixed(15)}',
      value: value,
      max: 30.0,
      min: 1.0,
      onChanged: onChanged,
    );
  }

  Future<ui.Image> _captureFilteredImageSegmentation() async {
    RenderRepaintBoundary boundary = _imageKeySegmentation.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    return image;
  }

  Future<void> _initSegment() async {
    // Use when user can go back and draw again
    // ui.Image filteredImage = await _captureFilteredImageSegmentation();
    // ByteData? byteData = await filteredImage.toByteData(
    //     format: ui.ImageByteFormat.png);
    // Uint8List uint8List = byteData!.buffer.asUint8List();

    final paintImage = _painterController.finish();
    final imageUint8List = await paintImage.toPNG();

    ui.Image originalImage = await decodeImageFromList(imageUint8List);
    // Create a recorder to capture the canvas
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // Define the size of the canvas
    final size =
        Size(originalImage.width.toDouble(), originalImage.height.toDouble());

    // Draw the original image on the canvas with the desired color filter
    Paint paint = Paint()
      ..colorFilter = const ColorFilter.mode(Colors.black, BlendMode.colorBurn);

    canvas.drawImage(originalImage, Offset.zero, paint);

    // End recording and convert to an image
    final picture = recorder.endRecording();
    final ui.Image segmentImg = await picture.toImage(
      originalImage.width,
      originalImage.height,
    );

    // Convert image to byte data
    final ByteData? segmentImgByte =
        await segmentImg.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List filteredPngBytes = segmentImgByte!.buffer.asUint8List();
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/segment.png';
    final imageFile = File(imagePath);
    await imageFile.writeAsBytes(filteredPngBytes);
    _controller.setFileSegmentation(imageFile.path);
    // if (mounted) {
    //   await showDialog<bool>(
    //     context: context,
    //     builder: (context) {
    //       return SimpleDialog(
    //         contentPadding: const EdgeInsets.all(6.0),
    //         titlePadding: const EdgeInsets.all(8.0),
    //         title: const Text('Cropped image'),
    //         children: [
    //           //Text('pixels: ${controller.cropSize}'),
    //           //Image.memory(imageProvider.currentImage!),
    //           Image.memory(
    //             filteredPngBytes,
    //           ),
    //
    //           TextButton(
    //             onPressed: () => Navigator.pop(context, true),
    //             child: const Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
  }

  void _initPrompt() {
    _controller.setPrompt(textController.text);
    return;
  }
}
