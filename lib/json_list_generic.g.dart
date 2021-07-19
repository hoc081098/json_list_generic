// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_list_generic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResult<T> _$PaginationResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationResult<T>(
      json['page'] as int,
      (json['items'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$PaginationResultToJson<T>(
  PaginationResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'items': instance.items.map(toJsonT).toList(),
    };
