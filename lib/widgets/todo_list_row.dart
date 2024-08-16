import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoListRow extends StatelessWidget {
  const TodoListRow({super.key, required this.todo, required this.onListTap});
  final Todo todo;
  final Function(Todo) onListTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.alarm),
      onTap: () => onListTap,
      title: Text(
        todo.note ?? '',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: todo.complete ? Colors.grey : Colors.black,
              decoration: todo.complete
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
      ),
    );
  }
}
