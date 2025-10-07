import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_event.dart';
import 'task_state.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:borading_week2/models/task.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskService taskService;

  TaskBloc(this.taskService) : super(TaskInitial()) {
    on<LoadTask>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await taskService.fetchTasksOnce(); // one-time fetch
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });

    on<AddTask>((event, emit) async {
      await taskService.addTask(event.text);
      add(LoadTask()); // reload tasks
    });

    on<UpdateTask>((event, emit) async {
      await taskService.setCompleted(event.id, event.isCompleted);
      add(LoadTask()); // reload tasks
    });

    // on<delete>((event, emit) async {
    //   await taskService.deleteTask(event.taskId);
    //   add(LoadTasks()); // reload tasks
    // });
  }
}
