import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTask extends TaskEvent {}

class AddTask extends TaskEvent {
  final String title;
  final String description;
  final DateTime dueDate;

  AddTask(this.title, this.description, this.dueDate);

  @override
  List<Object?> get props => [title, description, dueDate];
}

class UpdateTask extends TaskEvent {
  final String id;
  final String newTitle;
  final String newDescription;
  final DateTime newDueDate;
  final bool isCompleted;

  UpdateTask(
    this.id,
    this.newTitle,
    this.newDescription,
    this.newDueDate,
    this.isCompleted,
  );

  @override
  List<Object?> get props => [
    id,
    newTitle,
    newDescription,
    newDueDate,
    isCompleted,
  ];
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
