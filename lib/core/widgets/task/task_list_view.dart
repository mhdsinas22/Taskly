// TaskListView.dart
import 'package:borading_week2/bloc/task_bloc/task_bloc.dart';
import 'package:borading_week2/bloc/task_bloc/task_state.dart';
import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/widgets/task/empty_task_view.dart';
import 'package:borading_week2/core/widgets/task/task_tile.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListView extends StatelessWidget {
  final TaskService taskService;
  final TextEditingController taskcontroller;
  final TextEditingController serachcontroller;
  const TaskListView({
    super.key,
    required this.taskcontroller,
    required this.serachcontroller,
    required this.taskService,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
          if (state is TaskLoaded) {
            final tasks = state.tasks; // already filtered by Bloc
            if (tasks.isEmpty) return EmptyTaskView();
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final todo = tasks[index];
                return TaskTile(
                  taskService: taskService,
                  taskcontroller: taskcontroller,
                  taskModel: todo,
                );
              },
            );
          }
          return EmptyTaskView();
        },
      ),
    );
  }
}
