import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/todo_bloc.dart';
import '../models/todo.dart';
import '../screens/add_todo.dart';
import '../utils/bloc_utils.dart';

class BtnAddTodo extends StatelessWidget {
  const BtnAddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoDeleteInProgressState) {
          return const CircularProgressIndicator();
        }
        return IconButton(
          onPressed: () async {
            ScaffoldMessenger.of(context).clearSnackBars();
            setTodo(context, Todo());
            unawaited(
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddTodoPage(),
                ),
              ),
            );
          },
          icon: const Icon(Icons.add),
        );
      },
    );
  }
}
