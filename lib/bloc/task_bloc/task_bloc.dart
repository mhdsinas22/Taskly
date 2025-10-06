import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:borading_week2/bloc/task_bloc/task_event.dart';
import 'package:borading_week2/bloc/task_bloc/task_state.dart';
import 'package:borading_week2/services/task_service.dart';

/// Bloc that manages Task-related events and states.
/// Uses TaskService as the data layer (Firestore backend).
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskService service;

  TaskBloc(this.service) : super(TaskInitial()) {
    // Register event handlers
    on<LoadTask>(_onLoadTasks);
    on<AddTask>(_onAddTasks);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  /// Load all tasks from Firestore
  Future<void> _onLoadTasks(LoadTask event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final tasks = await service.fetchTasksOnce();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  /// Add a new task
  Future<void> _onAddTasks(AddTask event, Emitter<TaskState> emit) async {
    try {
      await service.addTask(event.text);
      add(LoadTask()); // reload after adding
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  /// Update task completion status
  Future<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    try {
      await service.setCompleted(event.id, event.isCompleted);
      add(LoadTask()); // reload after update
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  /// Delete a task
  Future<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    try {
      await service.deleteTask(event.id);
      add(LoadTask()); // reload after delete
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }
}
