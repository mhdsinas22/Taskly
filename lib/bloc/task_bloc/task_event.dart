import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTask extends TaskEvent {}

class AddTask extends TaskEvent {
  final String text;
  AddTask(this.text);
  @override
  List<Object?> get props => [text];
}

class UpdateTask extends TaskEvent {
  final String id;
  final String newText; // <-- add this
  final bool isCompleted;

  UpdateTask(this.id, this.newText, this.isCompleted);

  @override
  List<Object?> get props => [id, newText, isCompleted];
}

class SearchTasks extends TaskEvent {
  final String query;
  SearchTasks(this.query);
  @override
  List<Object?> get props => [query];
}

class DeleteTask extends TaskEvent {
  final String id; // id of the task to delete
  DeleteTask(this.id);

  @override
  List<Object?> get props => [id];
}

class ToggleTaskCompletion extends TaskEvent {
  final String id;
  final bool isCompleted;

  ToggleTaskCompletion(this.id, this.isCompleted);

  @override
  List<Object?> get props => [id, isCompleted];
}
