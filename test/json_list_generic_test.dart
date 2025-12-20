// @dart=3.8
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_list_generic/json_list_generic.dart';
import 'package:test/test.dart';

part 'json_list_generic_test.g.dart';

@JsonSerializable()
class TestUser {
  final String id;
  final String name;

  TestUser(this.id, this.name);

  factory TestUser.fromJson(Map<String, dynamic> json) =>
      _$TestUserFromJson(json);

  Map<String, dynamic> toJson() => _$TestUserToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

void main() {
  setUp(() {
    Factories.shared
        .registerFromJson<TestUser>((json) => TestUser.fromJson(json as dynamic));
    Factories.shared.registerToJson<TestUser>((user) => user.toJson());
  });

  test('PaginationResult can deserialize from JSON', () {
    final jsonString = jsonEncode({
      'page': 1,
      'items': [
        TestUser('1', 'User 1'),
        TestUser('2', 'User 2'),
      ],
    });

    final result = PaginationResult<TestUser>.fromJson(jsonDecode(jsonString));

    expect(result.page, 1);
    expect(result.items.length, 2);
    expect(result.items[0].id, '1');
    expect(result.items[0].name, 'User 1');
    expect(result.items[1].id, '2');
    expect(result.items[1].name, 'User 2');
  });

  test('PaginationResult can serialize to JSON', () {
    final users = [
      TestUser('1', 'User 1'),
      TestUser('2', 'User 2'),
    ];
    final result = PaginationResult<TestUser>(1, users);

    final json = result.toJson();

    expect(json['page'], 1);
    expect(json['items'], hasLength(2));
    expect(json['items'][0]['id'], '1');
    expect(json['items'][0]['name'], 'User 1');
    expect(json['items'][1]['id'], '2');
    expect(json['items'][1]['name'], 'User 2');
  });
}
