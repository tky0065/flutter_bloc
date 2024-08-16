import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/models/todo.dart';

Future<void> refreshTodo(BuildContext context) async {
  BlocProvider.of<TodoBloc>(context).add(const LoadToDoEvent());
}

Future<void> deleteTodo(BuildContext context, Todo todo) async {
  BlocProvider.of<TodoBloc>(context).add(DeleteToDoEvent(todo));
}

Future<void> updateTodo(BuildContext context, Todo todo) async {
  BlocProvider.of<TodoBloc>(context).add(UpdateToDoEvent(todo));
}

Future<void> addTodo(BuildContext context, Todo todo) async {
  BlocProvider.of<TodoBloc>(context).add(AddToDoEvent(todo));
}

Future<void> setTodo(BuildContext context, Todo todo) async {
  BlocProvider.of<TodoBloc>(context).add(SetToDoNoteEvent(todo));
}
