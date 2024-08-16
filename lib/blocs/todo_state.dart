part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends Equatable {
  const TodoState();
}

final class TodoInitialState extends TodoState {
  const TodoInitialState();
  @override
  List<Object?> get props => [];
}

final class InitializedState extends TodoState {
  const InitializedState();
  @override
  List<Object?> get props => [];
}

final class TodoCurrentState extends TodoState {
  final Todo todo;
  const TodoCurrentState(this.todo);
  @override
  List<Object?> get props => [todo];
}

final class TodoLoadingState extends TodoState {
  const TodoLoadingState();
  @override
  List<Object?> get props => [];
}

final class TodoLoadedState extends TodoState {
  final List<Todo> todos;
  const TodoLoadedState(this.todos);
  @override
  List<Object?> get props => [todos];
}

final class TodoErrorState extends TodoState {
  final String error;
  const TodoErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

final class TodoInProgressState extends TodoState {
  const TodoInProgressState();
  @override
  List<Object?> get props => [];
}

final class TodoAddInProgressState extends TodoState {
  const TodoAddInProgressState();
  @override
  List<Object?> get props => [];
}

final class TodoAddState extends TodoState {
  final bool success;
  const TodoAddState(this.success);
  @override
  List<Object?> get props => [success];
}

final class TodoUpdateInProgressState extends TodoState {
  const TodoUpdateInProgressState();
  @override
  List<Object?> get props => [];
}

final class TodoUpdateState extends TodoState {
  final bool success;
  const TodoUpdateState(this.success);
  @override
  List<Object?> get props => [success];
}

final class TodoDeleteInProgressState extends TodoState {
  const TodoDeleteInProgressState();
  @override
  List<Object?> get props => [];
}

final class TodoDeleteState extends TodoState {
  final bool success;
  const TodoDeleteState(this.success);
  @override
  List<Object?> get props => [success];
}
