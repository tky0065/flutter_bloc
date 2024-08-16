import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_list_row.dart';

class TodoListUI extends StatelessWidget {
  const TodoListUI({super.key, required this.todos, required this.onListTap});
  final List<Todo> todos;
  final Function(Todo) onListTap;
  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(child: Text("Aucune Tache en Cours"));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (context, index) =>
          TodoListRow(todo: todos[index], onListTap: onListTap),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: todos.length,
    );
  }
}
