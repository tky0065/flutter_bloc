import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/utils/bloc_utils.dart';

import '../models/todo.dart';

class BtnDeleteTodo extends StatelessWidget {
  const BtnDeleteTodo({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoDeleteInProgressState) {
          return const CircularProgressIndicator();
        }
        return SizedBox(
          height: 15,
          width: 15,
          child: IconButton(
            onPressed: () => deleteTodo(context, todo),
            icon: Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
