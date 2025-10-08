import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/widgets/task/empty_task_view.dart';
import 'package:borading_week2/core/widgets/task/task_tile.dart';
import 'package:borading_week2/models/task.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:flutter/material.dart';

class TaskListView extends StatelessWidget {
  final TaskService taskService;
  final TextEditingController taskcontroller;
  const TaskListView({
    super.key,
    required this.taskService,
    required this.taskcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<TaskModel>>(
        stream: taskService.tasksStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return EmptyTaskView();
          }
          final tasks = snapshot.data!;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              var todo = tasks[index];
              return TaskTile(
                taskService: taskService,
                taskcontroller: taskcontroller,
                taskModel: todo,
              );
            },
          );
        },
      ),
    );
  }
}
