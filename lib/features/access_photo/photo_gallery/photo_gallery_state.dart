import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_manager/photo_manager.dart';

part 'photo_gallery_state.freezed.dart';

@freezed
class PhotoGalleryState with _$PhotoGalleryState {
  const factory PhotoGalleryState({
    @Default([]) List<AssetEntity> allAssets,
    @Default([]) List<AssetEntity> faceAssets,
    @Default(false) bool loading,
    @Default(0) int currentIndex,
    @Default(0) double progress,
  }) = _PhotoGalleryState;
}
