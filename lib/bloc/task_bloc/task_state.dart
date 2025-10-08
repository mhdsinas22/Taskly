import 'package:borading_week2/models/task.dart';
import 'package:equatable/equatable.dart';

abstract class TaskState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;
  final String searchQuery;

  TaskLoaded(this.tasks, {this.searchQuery = ""});

  @override
  List<Object?> get props => [tasks, searchQuery]; // ✅ include searchQuery
}

class TaskError extends TaskState {
  final String message;
  TaskError(this.message);
  @override
  List<Object?> get props => [message];
}
