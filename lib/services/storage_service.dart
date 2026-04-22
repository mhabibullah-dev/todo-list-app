import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo_item.dart';

/// Handles all SharedPreferences read/write operations for [TodoItem] lists.
class StorageService {
  static const String _tasksKey = 'todo_tasks';

  /// Load all tasks from SharedPreferences.
  /// Returns an empty list if none are saved yet.
  static Future<List<TodoItem>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_tasksKey);
    if (jsonList == null || jsonList.isEmpty) return [];
    return TodoItem.decodeList(jsonList);
  }

  /// Persist the entire task list to SharedPreferences.
  static Future<void> saveTasks(List<TodoItem> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_tasksKey, TodoItem.encodeList(tasks));
  }

  /// Clear all tasks from SharedPreferences.
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tasksKey);
  }
}
