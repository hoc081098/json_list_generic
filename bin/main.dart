import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:json_list_generic/json_list_generic.dart';

part 'main.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String name;

  User(this.id, this.name);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() => 'User{id: $id, name: $name}';
}

@JsonSerializable()
class Item {
  final String id;
  final String title;

  Item(this.id, this.title);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  String toString() => 'Item{id: $id, title: $title}';
}

void main() {
  Factories.shared
      .registerFromJson<User>((json) => User.fromJson(json as dynamic));
  Factories.shared.registerToJson<User>((user) => user.toJson());

  Factories.shared
      .registerFromJson<Item>((json) => Item.fromJson(json as dynamic));

  final jsonString1 = jsonEncode({
    'page': 1,
    'items': [
      User('1', 'name 1'),
      User('2', 'name 2'),
      User('3', 'name 3'),
      User('4', 'name 4'),
    ],
  });
  var users = PaginationResult<User>.fromJson(jsonDecode(jsonString1));
  print(users);
  print(users.toJson());

  print('\n------------------------\n');

  final jsonString2 = jsonEncode({
    'page': 1,
    'items': [
      Item('1', 'name 1'),
      Item('2', 'name 2'),
      Item('3', 'name 3'),
      Item('4', 'name 4'),
    ],
  });
  var items = PaginationResult<Item>.fromJson(jsonDecode(jsonString2));
  print(items);
  print(items.toJson());
}
