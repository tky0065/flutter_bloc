import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/repo/todo_repo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepo _todoRepo;
  TodoBloc(this._todoRepo) : super(const TodoInitialState()) {
    on<InitializeEvent>(init);
    on<AddToDoEvent>(addTodo);
    on<UpdateToDoEvent>(updateTodo);
    on<DeleteToDoEvent>(deleteTodo);
    on<LoadToDoEvent>(loadTodos);
    on<SetToDoNoteEvent>(setTodo);
  }

  Future<void> init(event, emit) async {
    await _todoRepo.initDB();
    emit(const InitializedState());
  }

  Future<void> addTodo(AddToDoEvent event, emit) async {
    emit(const TodoInProgressState());
    try {
      await _todoRepo.saveTodo(event.todo);
      emit(const TodoAddState(true));
    } catch (e) {
      emit(const TodoAddState(false));
    }
  }

  Future<void> updateTodo(UpdateToDoEvent event, emit) async {
    emit(const TodoUpdateInProgressState());
    try {
      await _todoRepo.updateTodo(event.todo);
      emit(const TodoUpdateState(true));
    } catch (e) {
      emit(const TodoUpdateState(false));
    }
  }

  Future<void> deleteTodo(DeleteToDoEvent event, emit) async {
    emit(const TodoDeleteInProgressState());
    try {
      await _todoRepo.deleteTodo(event.todo);
      emit(const TodoDeleteState(true));
    } catch (e) {
      emit(const TodoDeleteState(false));
    }
  }

  Future<void> loadTodos(LoadToDoEvent event, emit) async {
    emit(const TodoLoadingState());
    try {
      final todos = await _todoRepo.getTodos();
      emit(TodoLoadedState(todos));
    } catch (e) {
      emit(TodoErrorState(e.toString()));
    }
  }

  Future<void> setTodo(SetToDoNoteEvent event, emit) async {
    emit(TodoCurrentState(event.todo));
  }
}
