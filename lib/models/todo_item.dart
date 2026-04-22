import 'dart:convert';

class TodoItem {
  final String id;
  String title;
  bool isDone;
  final DateTime createdAt;

  TodoItem({
    required this.id,
    required this.title,
    this.isDone = false,
    required this.createdAt,
  });

  /// Convert to a JSON-encodable map for SharedPreferences storage.
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isDone': isDone,
        'createdAt': createdAt.toIso8601String(),
      };

  /// Reconstruct from a JSON string stored in SharedPreferences.
  factory TodoItem.fromJson(Map<String, dynamic> json) => TodoItem(
        id: json['id'] as String,
        title: json['title'] as String,
        isDone: json['isDone'] as bool? ?? false,
        createdAt: DateTime.parse(json['createdAt'] as String),
      );

  /// Serialize a list of [TodoItem] to a list of JSON strings.
  static List<String> encodeList(List<TodoItem> items) =>
      items.map((item) => jsonEncode(item.toJson())).toList();

  /// Deserialize a list of JSON strings back to [TodoItem] objects.
  static List<TodoItem> decodeList(List<String> jsonList) => jsonList
      .map((j) => TodoItem.fromJson(jsonDecode(j) as Map<String, dynamic>))
      .toList();
}
