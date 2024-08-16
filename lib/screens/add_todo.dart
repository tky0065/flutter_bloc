import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/utils/utils.dart';

import '../utils/bloc_utils.dart';
import '../utils/nav_utils.dart';
import '../widgets/btn_delete_todo.dart';
import '../widgets/btn_save_update_todo.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key, this.todo});

  final Todo? todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text(null == todo ? "Ajouter" : "Modifier"),
        actions: [
          BtnSaveUpdateTodo(todo: todo),
          if (null != todo) BtnDeleteTodo(todo: todo!)
        ],
      ),
      body: _addEditUI(),
    );
  }

  Future<void> blocListener(BuildContext context, TodoState state) async {
    if (state is TodoUpdateState) {
      if (state.success) {
        unawaited(showSnackbar("Tache mise a jour avec succès"));
        // close screen
        closePage();
        refreshTodo(context);
        return;
      }
      unawaited(showSnackbar("Erreur de mise a jour"));
    }

    if (state is TodoAddState) {
      if (state.success) {
        unawaited(showSnackbar("Tache enregistrer avec succès"));
        // close screen
        closePage();
        refreshTodo(context);
        return;
      }
      unawaited(showSnackbar("Erreur d'enregistrement"));
    }
    if (state is TodoDeleteState) {
      if (state.success) {
        unawaited(showSnackbar("Tache Supprimé avec succès"));
        // close screen
        closePage();
        refreshTodo(context);
        return;
      }
      unawaited(showSnackbar("Erreur de Suppression"));
    }
  }

  Widget _addEditUI() {
    return BlocListener<TodoBloc, TodoState>(
      listener: blocListener,
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoAddInProgressState) {
            return const Center(
              child: Text("Enregistrement de la Tache ..."),
            );
          }

          if (state is TodoUpdateInProgressState) {
            return const Center(
              child: Text("Mise a jour de la Tache ..."),
            );
          }

          if (state is TodoDeleteInProgressState) {
            return const Center(
              child: Text("Suppression  de la Tache ..."),
            );
          }

          return _formUI(context);
        },
      ),
    );
  }

  Widget _formUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Ajouter une Tache"),
            initialValue: todo?.note,
            onChanged: (value) {
              if (null == todo) {
                final newTdo = Todo();
                newTdo.note = value;
                setTodo(context, newTdo);
                return;
              }
              todo?.note = value;
              setTodo(context, todo!);
            },
          )
        ],
      ),
    );
  }
}
