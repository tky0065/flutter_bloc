part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class InitializeEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class SetToDoNoteEvent extends TodoEvent {
  final Todo todo;

  SetToDoNoteEvent(this.todo);
  @override
  List<Object?> get props => [];
}

class LoadToDoEvent extends TodoEvent {
  const LoadToDoEvent();
  @override
  List<Object?> get props => [];
}

class AddToDoEvent extends TodoEvent {
  final Todo todo;

  AddToDoEvent(this.todo);
  @override
  List<Object?> get props => [];
}

class AddToDoInProgressEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class UpdateToDoEvent extends TodoEvent {
  final Todo todo;

  UpdateToDoEvent(this.todo);
  @override
  List<Object?> get props => [];
}

class UpdateToDoInProgressEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class DeleteToDoEvent extends TodoEvent {
  final Todo todo;

  DeleteToDoEvent(this.todo);
  @override
  List<Object?> get props => [];
}

class DeleteToDoInProgressEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}
