# json_list_generic

Demo how to parse `JSON` to a generic list `List<T>` with `T` is the model class you defined (use `json_annotation` library).

# Run example: `bin/main.dart`

```dart
void main(List<String> arguments) {
  Factories.shared.registerFromJson<User>((json) => User.fromJson(json as dynamic));
  Factories.shared.registerToJson<User>((user) => user.toJson());

  Factories.shared.registerFromJson<Item>((json) => Item.fromJson(json as dynamic));

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
```