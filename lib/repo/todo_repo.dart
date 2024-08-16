import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/models/todo.dart';

class TodoRepo {
  late final Isar _isar;

  Future<void> initDB() async {
    final dir = await getApplicationCacheDirectory();
    _isar = await Isar.open([TodoSchema], directory: dir.path);
  }

  Future<void> saveTodo(Todo todo) async {
    await _isar.writeTxn(() async => _isar.todos.put(todo));
  }

  Future<void> updateTodo(Todo todo) async {
    await _isar.writeTxn(() async => _isar.todos.put(todo));
  }

  Future<Todo?> getTodo(Todo todo) async {
    return await _isar.todos.get(todo.id);
  }

  Future<List<Todo>> getTodos() async {
    final isarCollection = await _isar.todos;
    final todos = await isarCollection.where().sortByComplete().findAll();
    return todos;
  }

  Future<void> deleteTodo(Todo todo) async {
    await _isar.writeTxn(() async => _isar.todos.delete(todo.id));
  }
}
