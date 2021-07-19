import 'package:json_annotation/json_annotation.dart';

part 'json_list_generic.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationResult<T> {
  final int page;

  final List<T> items;

  PaginationResult(this.page, this.items);

  factory PaginationResult.fromJson(Map<String, dynamic> json) =>
      _$PaginationResultFromJson(
        json,
        Factories.shared.getFromJson<T>(),
      );

  Map<String, dynamic> toJson() => _$PaginationResultToJson(
        this,
        Factories.shared.getToJson<T>(),
      );

  @override
  String toString() => 'PaginationResult{page: $page, items: $items}';
}

typedef FromJsonT<T> = T Function(Object? json);
typedef ToJsonT<T> = Object Function(T value);

class Factories {
  final _fromJsonFunctions = <Type, Object? Function(Object? json)>{};
  final _toJsonFunctions = <Type, Object? Function(Object? value)>{};

  static final shared = Factories._();

  Factories._();

  void registerFromJson<T>(FromJsonT<T> fromJson) =>
      _fromJsonFunctions[T] = fromJson;

  FromJsonT<T> getFromJson<T>() {
    var f = _fromJsonFunctions[T];
    if (f == null) {
      throw StateError('Must call registerFromJson<T>(fromJson) before using');
    }
    return f as FromJsonT<T>;
  }

  /// Optional. Default is `toJson()` method.
  void registerToJson<T>(ToJsonT<T> toJson) =>
      _toJsonFunctions[T] = (value) => toJson(value as T);

  ToJsonT<T> getToJson<T>() {
    var f = _toJsonFunctions[T];
    return f == null ? (v) => (v as dynamic).toJson() : f as ToJsonT<T>;
  }
}
