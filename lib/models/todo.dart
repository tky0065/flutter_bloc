import 'package:isar/isar.dart';

part 'todo.g.dart';

@collection
class Todo {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? note;

  bool complete = false;
}
