import 'package:borading_week2/bloc/task_bloc/task_event.dart';
import 'package:borading_week2/bloc/task_bloc/task_state.dart';
import 'package:borading_week2/models/task.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskService taskService;
  List<TaskModel> _allTasks = []; // store all tasks
  String _currentQuery = ""; // store current search query

  TaskBloc(this.taskService) : super(TaskInitial()) {
    // Load all tasks
    on<LoadTask>((event, emit) async {
      emit(TaskLoading());
      try {
        _allTasks = await taskService.fetchTasksOnce();
        _filterAndEmit(emit);
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });

    // Add new task
    on<AddTask>((event, emit) async {
      try {
        await taskService.addTask(event.text);
        add(LoadTask()); // reload tasks
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });

    // Update task (text or completion)
    on<UpdateTask>((event, emit) async {
      try {
        await taskService.updateTask(
          event.id,
          event.newText,
          event.isCompleted,
        );
        add(LoadTask()); // reload tasks
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });
    on<DeleteTask>((event, emit) async {
      try {
        await taskService.deleteTask(event.id);
        add(LoadTask()); // reload tasks after delete
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });
    // Search tasks
    on<SearchTasks>((event, emit) {
      _currentQuery = event.query;
      _filterAndEmit(emit);
    });
    on<ToggleTaskCompletion>((event, emit) async {
      try {
        await taskService.setCompleted(event.id, event.isCompleted);
        add(LoadTask()); // reload tasks after updating completion
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });
  }

  // Helper to filter tasks by current search query
  void _filterAndEmit(Emitter<TaskState> emit) {
    final filtered =
        _allTasks
            .where(
              (t) => t.tasktext.toLowerCase().contains(
                _currentQuery.toLowerCase(),
              ),
            )
            .toList();
    emit(TaskLoaded(filtered, searchQuery: _currentQuery));
  }
}
