import '../../../init/index.dart';
import '../../../packages/domain/dto/predefined_image_dto.dart';
import '../../../packages/index.dart';
import '../../click_management/click_management.dart';
import 'face_ai_state.dart';

class FaceAiController extends Cubit<FaceAIState> {
  final _repository = sl.get<Repository>();
  final _clickManager = sl.get<ClickManagement>();
  late ScrollController _sc;
  final String _pathFile;
  List<PredefinedImageDto> _imageList = [];
  String? _urlFile;
  String _additions = '';
  List<CategoryDto> _categories = [];
  late final bool _needUpload;
  late TextEditingController _textController;

  final int currentImageIncrement = 20;

  final GlobalKey<AnimatedGridState> gridKey = GlobalKey<AnimatedGridState>();

  FaceAiController(String pathFile, bool needUpload)
      : _pathFile = pathFile,
        _needUpload = needUpload,
        super(const FaceAIState(loading: true)) {
    _initText();
    _initImage();
  }

  void _initText() async {
    _textController = TextEditingController();
    _textController.addListener(_updateAdditions);

    if (_needUpload) {
      _uploadFile();
    } else {
      _urlFile = _pathFile;
    }

    await _getCategories();

    emit(state.copyWith(
      categories: _categories,
      loading: false,
    ));
  }

  void _initImage() async {
    _sc = ScrollController();
    _sc.addListener(() async {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        await _getMoreImages();
      }
    });

    //TODO: Change this to new API when available
    _imageList = await _repository.getImageTemplatesPhotoStyle();
    await _getMoreImages();
  }

  ScrollController getScrollController() {
    return _sc;
  }

  void selectImage(int index) {
    emit(state.copyWith(
      selectedIndex: index,
      generateEnableImage: true,
    ));
  }

  void enableAdditionField() {
    emit(state.copyWith(
      enableAdditions: true,
    ));
  }

  Future<void> _getMoreImages() async {
    if (!state.loading) {
      emit(state.copyWith(loading: true));
    }
    List<String> newImages = [];
    List<String> images = [];
    images.addAll(state.images);
    //TODO: Change this to new API
    //TODO: Bug fix: There is a very incomprehensible bug where it produces RangeError when scrolling but I cannot consistently recreate the bug.
    //It would happen some times and not the others, despite the same user input. Current hot fix is module(%)
    int srt = currentImageIncrement * state.currentPage;
    int end = currentImageIncrement * (state.currentPage + 1);
    for (int i = srt; i < _imageList.length && i < end; i++) {
      newImages.add(_imageList[i].url!);
      gridKey.currentState
          ?.insertItem(i, duration: const Duration(milliseconds: 500));
    }
    images.addAll(newImages);
    emit(state.copyWith(
        loading: false, images: images, currentPage: state.currentPage + 1));
  }

  Future<void> _getCategories() async {
    List<CategoryDto> categories = await _repository.getCategoriesTextStyle();
    _categories = categories;
  }

  void _updateAdditions() {
    _additions = _textController.text;
    emit(state.copyWith(
      generateEnableText: _checkGenerateEnableText(),
    ));
  }

  TextEditingController getTextController() {
    return _textController;
  }

  void _uploadFile() async {
    if (_pathFile.isBlank) {
      return;
    }

    if (_pathFile.startsWith('https')) {
      _urlFile = _pathFile;
      return;
    }
    String fileName = _pathFile.split(Platform.pathSeparator).last;

    final storage = FirebaseStorage.instance
        .ref()
        .child('mobile-uploaded')
        .child('${Platform.pathSeparator}$fileName');

    try {
      await storage.putFile(File(_pathFile));
    } on FirebaseException {
      // ...
    }

    _urlFile = await storage.getDownloadURL();
  }

  void updateTrait({
    required TraitDto trait,
    required int categoryIndex,
    required int traitIndex,
  }) {
    List<CategoryDto> categories = state.categories;

    if (categories.isEmpty || categories.length <= categoryIndex) {
      return;
    }

    CategoryDto categoryDto = categories[categoryIndex];

    List<TraitDto> traits = categories[categoryIndex].traits;
    if (traits.isEmpty || traits.length <= traitIndex) {
      return;
    }

    for (int i = 0; i < traits.length; i++) {
      traits[i] = traits[i].copyWith(selected: false);
    }

    traits[traitIndex] = trait.copyWith(selected: !trait.selected);

    categoryDto.traits = traits;

    _categories = categories.map((e) => e.copyWith()).toList();

    emit(state.copyWith(
      categories: _categories,
      generateEnableText: _checkGenerateEnableText(),
    ));
  }

  void updateReRender() {
    List<CategoryDto> categories = List.of(state.categories);

    if (categories.isEmpty) {
      return;
    }

    List<CategoryDto> updatedCategories = [];

    for (int i = 0; i < categories.length; i++) {
      CategoryDto categoryDto = categories[i];
      if (categoryDto.cachable == false) {
        List<TraitDto> traits = List.of(categoryDto.traits);
        for (int j = 0; j < traits.length; j++) {
          if (traits[j].selected) {
            traits[j] = traits[j].copyWith(selected: false);
          }
        }
        updatedCategories.add(categoryDto.copyWith(traits: traits));
      } else {
        updatedCategories.add(categoryDto);
      }
    }

    emit(state.copyWith(
      categories: updatedCategories,
      generateEnableText: _checkGenerateEnableText(),
    ));
  }

  bool _checkGenerateEnableText() {
    if (_additions.isNotEmpty) {
      return true;
    }
    bool hasTrait = state.categories.firstWhereOrNull((element) {
          return element.traits.firstWhereOrNull((trait) {
                return trait.selected;
              }) !=
              null;
        }) !=
        null;

    return hasTrait;
  }

  Future<void> generateByImage(void Function(List<String> images) callback,
      {required BuildContext context}) async {
    if (_pathFile.isBlank) {
      callback([]);
      return;
    }

    if (_urlFile.isNotBlank) {
      final images = await _generateByImage();
      callback(images);
      return;
    }
    Timer.periodic(100.milliseconds, (timer) async {
      if (!_urlFile.isBlank) {
        timer.cancel();
        var images = await _generateByImage();
        callback(images);
      }
    });
    return;
  }

  Future<List<String>> _generateByImage() async {
    String templateId = '';
    if (state.selectedIndex == null) {
      return [_urlFile!];
    } else {
      templateId = _imageList[state.selectedIndex!].id!;
    }

    List<String> urls = await _repository.genByImage(
        userPhoto: _urlFile!, templateId: templateId);
    return urls;
  }

  Future<void> generateByText(
    void Function(List<String> images) callback, {
    required BuildContext context,
  }) async {
    if (_pathFile.isBlank) {
      callback([]);
      return;
    }

    if (_urlFile.isNotBlank) {
      final images = await _generateByText();
      callback(images);
      return;
    }
    Timer.periodic(100.milliseconds, (timer) async {
      if (!_urlFile.isBlank) {
        timer.cancel();
        var images = await _generateByText();
        callback(images);
      }
    });
    return;
  }

  Future<List<String>> _generateByText() async {
    List<String> traitIds = [];

    for (var element in state.categories) {
      for (var trait in element.traits) {
        if (trait.selected && trait.id != null) {
          traitIds.add(trait.id!);
        }
      }
    }

    List<String> urls = await _repository.generateTextStyle(
      url: _urlFile!,
      traits: traitIds,
      additions: _additions.isEmpty ? null : _additions,
    );

    return urls;
  }

  Future<bool> checkClicks(BuildContext context) {
    return _clickManager.checkClickAndHandle(context);
  }
}
