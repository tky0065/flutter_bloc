import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/utils/bloc_utils.dart';
import 'package:todo_app/utils/nav_utils.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widgets/btn_add_todo.dart';
import 'package:todo_app/widgets/todo_list_ui.dart';

import '../widgets/error_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: const Text("Gestion des Taches"),
        actions: const [BtnAddTodo()],
      ),
      body: BlocListener<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is InitializedState) {
            refreshTodo(context);
          }
        },
        child: BlocBuilder<TodoBloc, TodoState>(
          buildWhen: (previous, current) => previous is! TodoLoadedState,
          builder: (context, state) {
            if (state is InitializedState) {
              return const Text("Initialisation...");
            }

            if (state is TodoLoadingState) {
              return const Text("Chargement...");
            }
            if (state is TodoLoadedState) {
              return TodoListUI(
                  todos: state.todos,
                  onListTap: (todo) {
                    clearAllSnackbar();
                    setTodo(context, todo);
                    // open add todo screen
                    unawaited(openAddTodoPage(todo: todo));
                  });
            }

            if (state is TodoErrorState) {
              return ToDoErrorUI(message: state.error);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
