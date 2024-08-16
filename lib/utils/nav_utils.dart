import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/add_todo.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> openAddTodoPage({Todo? todo}) async {
  Navigator.of(navigatorKey.currentContext!).push(
    MaterialPageRoute(
      builder: (context) => AddTodoPage(
        todo: todo,
      ),
    ),
  );
}

Future<void> closePage() async {
  Navigator.pop(navigatorKey.currentContext!);
}
