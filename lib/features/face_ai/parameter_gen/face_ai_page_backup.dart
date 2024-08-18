// import 'package:photo_ai/generated/index.dart';
// import 'package:photo_ai/init/index.dart';
//
// import '../../../packages/index.dart';
// import '../../index.dart';
// import '../index.dart';
// import 'face_ai_controller.dart';
// import 'face_ai_state.dart';
//
// class FaceAiPage extends StatefulWidget {
//   final String pathFile;
//
//   const FaceAiPage({super.key, required this.pathFile});
//
//   @override
//   State<FaceAiPage> createState() => _FaceAiPageState();
// }
//
// class _FaceAiPageState extends State<FaceAiPage> {
//   late final FaceAiController _controller;
//   OverlayEntry? _loadingOverlayEntry;
//   final toastController = ShowToastController();
//
//   FaceAiController _createController() {
//     _controller = FaceAiController(widget.pathFile);
//     return _controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => _createController(),
//       child: BlocBuilder<FaceAiController, FaceAIState>(
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBarComponent(
//               title: AppText(
//                 context.loc.enhance_face_ai,
//                 style: context.heading6,
//               ),
//               centerTitle: true,
//             ),
//             backgroundColor: context.color.white,
//             body: _buildUI(context, state),
//             bottomNavigationBar: _buildBottomUI(context, state),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildUI(BuildContext context, FaceAIState state) {
//     if (state.loading) {
//       return const YDLazyLoadingWidget();
//     }
//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(
//         horizontal: context.padding16X,
//         vertical: context.padding16X,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildAdditionsWidget(context),
//           Column(
//             children: List.generate(state.categories.length, (index) {
//               var item = state.categories[index];
//               return _buildLineItems(
//                 context,
//                 title: item.name ?? '',
//                 traits: item.traits,
//                 categoryIndex: index,
//               );
//             }).toList(),
//           ),
//           // _buildAdditionsWidget(context),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBottomUI(BuildContext context, FaceAIState state) {
//     return Container(
//       alignment: Alignment.center,
//       height: kToolbarHeight,
//       width: context.width,
//       padding: EdgeInsets.symmetric(
//         horizontal: context.padding16X,
//         vertical: context.padding8X,
//       ),
//       decoration: BoxDecoration(
//         color: context.color.backgroundWhite,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 8,
//             offset: const Offset(0, -2),
//             spreadRadius: 0,
//           )
//         ],
//       ),
//       child: AppFilledButton(
//         width: context.width,
//         onPressed: state.generateEnable
//             ? () async {
//                 bool check =
//                     await _checkClickAndHandle(context, toastController);
//                 if (check) {
//                   _handleGen(context, state);
//                 }
//               }
//             : null,
//         child: AppText(
//           context.loc.face_ai_generate,
//           style: context.button3.copyWith(color: context.color.white),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLineItems(
//     BuildContext context, {
//     required String title,
//     required List<TraitDto> traits,
//     required int categoryIndex,
//   }) {
//     return Container(
//       width: context.width,
//       padding: EdgeInsets.only(top: context.padding20X),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AppText(
//             title.convertFirstCapitalize(),
//             style: context.heading6,
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: context.padding16X),
//             child: Wrap(
//               key: const Key('value'),
//               runSpacing: 12,
//               spacing: 16,
//               children: List.generate(traits.length, (index) {
//                 var trait = traits[index];
//                 return _buildItemCategory(
//                   context,
//                   trait: trait,
//                   categoryIndex: categoryIndex,
//                   traitIndex: index,
//                 );
//               }),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildItemCategory(
//     BuildContext context, {
//     required TraitDto trait,
//     required int categoryIndex,
//     required int traitIndex,
//   }) {
//     return YdInkWell(
//       borderRadius: context.borderMaxLarge,
//       onTap: () {
//         _controller.updateTrait(
//           trait: trait,
//           categoryIndex: categoryIndex,
//           traitIndex: traitIndex,
//         );
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           vertical: context.padding4X,
//           horizontal: context.padding16X,
//         ),
//         decoration: BoxDecoration(
//           color: trait.selected
//               ? context.color.alertInfo
//               : context.color.backgroundLight2,
//           borderRadius: context.borderMaxLarge,
//         ),
//         child: AppText(
//           trait.name ?? '',
//           style: context.heading8.copyWith(
//             color:
//                 trait.selected ? context.color.white : context.color.alertInfo,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAdditionsWidget(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AppText(
//             context.loc.additional_prompt,
//             style: context.heading6,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10.0),
//             child: TextField(
//               style: context.heading8,
//               controller: _controller.getTextController(),
//               maxLines: null,
//               decoration: InputDecoration(
//                 fillColor: Colors.white,
//                 filled: true,
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 contentPadding: EdgeInsets.all(15.0),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey, width: 1.5),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _handleGen(BuildContext context, FaceAIState state) async {
//     _showLoadingOverlay(context, 'assets/loading/AI_Loading.json');
//     _controller.generate(context: context,
//         (images, traitIds, url, additions) async {
//       if (context.mounted && images.isNotEmpty) {
//         _removeLoadingOverlay();
//         // context.navigateAIFaceResult(images: images, traitIds: traitIds, url: url, additions: additions);
//         await Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => AIGenResultPage(
//                 images: images,
//                 traitIds: traitIds,
//                 url: url,
//                 additions: additions),
//           ),
//         ).then((value) {
//           _controller.updateReRender();
//         });
//       }
//     });
//   }
//
//   Future<bool> _checkClickAndHandle(
//       BuildContext context, ShowToastController toastController) async {
//     int clicks = await _controller.getNumOfClicks();
//     if (clicks == 0) {
//       toastController.showToast(context, 'Warning',
//           "You've run out of clicks. Purchase more clicks to continue this activity.");
//       return false;
//     } else if (clicks == -1) {
//       toastController.showToast(
//           context, 'Error', "An error occurred. Please try again later.");
//       return false;
//     }
//     return true;
//   }
//
//   void _showLoadingOverlay(BuildContext context, String url) {
//     _loadingOverlayEntry = OverlayEntry(
//       builder: (context) => AnimationLoading(
//         urlFromAssets: url,
//       ),
//     );
//     Overlay.of(context)?.insert(_loadingOverlayEntry!);
//   }
//
//   void _removeLoadingOverlay() {
//     _loadingOverlayEntry?.remove();
//     _loadingOverlayEntry = null;
//   }
// }




// SingleChildScrollView(
// padding: EdgeInsets.symmetric(
// horizontal: context.padding16X,
// vertical: context.padding16X,
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// _buildAdditionsWidget(context),
// Column(
// children: List.generate(state.categories.length, (index) {
// var item = state.categories[index];
// return _buildLineItems(
// context,
// title: item.name ?? '',
// traits: item.traits,
// categoryIndex: index,
// );
// }).toList(),
// ),
// // _buildAdditionsWidget(context),
// ],
// ),
// )