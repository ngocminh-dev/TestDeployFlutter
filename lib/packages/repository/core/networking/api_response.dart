import 'package:freezed_annotation/freezed_annotation.dart';

import '../helper/index.dart';

part 'api_response.freezed.dart';

part 'api_response.g.dart';

@freezed
sealed class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success({required T data}) = Success;

  const factory ApiResponse.error({required String message}) = Error;
}

extension ApiResponseExt<T> on ApiResponse<T> {
  bool get isSuccess => this is Success;

  bool get isError => this is Error;
}

class ListResponse<T> {
  late Metadata metadata;
  late List<T> items;

  static ListResponse<T> fromJson<T>(
    Map<String, dynamic> json,
    T Function(JSON jSon) convert,
  ) {
    final l = json['items'] as List;
    List<T> values = List<T>.from(l.map((element) => convert(element)));

    return ListResponse<T>()
      ..metadata = Metadata.fromJson(json['metadata'])
      ..items = values;
  }

  static ListResponse<T> empty<T>() {
    return ListResponse<T>()
      ..metadata = const Metadata(total: 0, page: 1, limit: 30)
      ..items = [];
  }
}

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    required int total,
    required int page,
    required int limit,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}

extension MetadataExt on Metadata {
  bool get canLoadMore {
    return (page * limit < total);
  }
}
