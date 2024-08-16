import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/utils/bloc_utils.dart';
import 'package:todo_app/utils/utils.dart';

class BtnSaveUpdateTodo extends StatelessWidget {
  const BtnSaveUpdateTodo({super.key, this.todo});
  final Todo? todo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Expanded(
          child: IconButton(
            onPressed: () => _addOrUpdateTodo(context, state),
            icon: Icon(null == todo ? Icons.update : Icons.check),
          ),
        );
      },
    );
  }

  _addOrUpdateTodo(BuildContext context, TodoState state) {
    if (null != todo) {
      if (todo?.note == null || todo!.note!.isEmpty) {
        unawaited(showSnackbar('Please enter a note'));
        return;
      }
      updateTodo(context, todo!);
      return;
    }
    if (state is TodoCurrentState) {
      if (state.todo.note == null || state.todo.note!.isEmpty) {
        unawaited(showSnackbar('Please enter a note'));
        return;
      }
      addTodo(context, state.todo);
      return;
    }
  }
}
