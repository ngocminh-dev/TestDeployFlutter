extension StringOptionExt on String? {
  bool get isBlank {
    if (this == null) {
      return true;
    }
    if (this!.trim().isEmpty) return true;
    return false;
  }

  bool get isNotBlank {
    return !isBlank;
  }

  String convertFirstCapitalize() {
    if (this == null) return '';
    if (this!.isEmpty) return '';
    return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
  }
}
