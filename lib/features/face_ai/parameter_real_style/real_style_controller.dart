import '../../../init/index.dart';
import '../../../packages/index.dart';
import '../../click_management/click_management.dart';
import 'real_style_state.dart';

class RealStyleController extends Cubit<RealStyleState> {
  final _repository = sl.get<Repository>();
  final _clickManager = sl.get<ClickManagement>();
  final String _pathFile;
  String? _urlFile;
  late final bool _needUpload;
  late Map<String, String> _categoriesAdditions;
  List<CategoryDto> _categories = [];

  RealStyleController(String pathFile, bool needUpload)
      : _pathFile = pathFile,
        _needUpload = needUpload,
        super(const RealStyleState(loading: true)) {
    _init();
  }

  void _init() async {
    if (_needUpload) {
      _uploadFile();
    } else {
      _urlFile = _pathFile;
    }

    _categories = await _repository.getCategoriesInPainting();
    _categoriesAdditions = {};

    emit(state.copyWith(
      categories: _categories,
      loading: false,
    ));
  }

  void updateAdditions(String? index, String text) {
    if (index == null) {
      return;
    }
    _categoriesAdditions[index] = text;
    emit(state.copyWith(
      generateEnable: _checkGenerateEnable(),
    ));
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
      generateEnable: _checkGenerateEnable(),
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
      generateEnable: _checkGenerateEnable(),
    ));
  }

  bool _checkGenerateEnable() {
    for (var addition in _categoriesAdditions.values) {
      if (addition.isNotEmpty) {
        return true;
      }
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

  Future<void> generate(void Function(List<String> images) callback,
      {required BuildContext context}) async {
    if (_pathFile.isBlank) {
      callback([]);
      return;
    }

    if (_urlFile.isNotBlank) {
      final images = await _generate();
      callback(images);
      return;
    }
    Timer.periodic(100.milliseconds, (timer) async {
      if (!_urlFile.isBlank) {
        timer.cancel();
        var images = await _generate();
        callback(images);
      }
    });
    return;
  }

  Future<List<String>> _generate() async {
    List<String> traitIds = [];
    List<String> categoriesHavingAddition = [];
    String additions = '';

    for (var element in state.categories) {
      for (var trait in element.traits) {
        if (trait.selected && trait.id != null) {
          traitIds.add(trait.id!);
        }
      }
    }

    _categoriesAdditions.forEach((key, value) {
      if (value.isNotEmpty) {
        additions = '$additions$value.';
        categoriesHavingAddition.add(key);
      }
    });

    List<String> urls = await _repository.generateInPainting(
        url: _urlFile!,
        traits: traitIds,
        additions: additions.isEmpty ? null : additions,
        categoriesHavingAdditions: categoriesHavingAddition);

    return urls;
  }

  Future<bool> checkClicks(BuildContext context) {
    return _clickManager.checkClickAndHandle(context);
  }
}
