import 'package:borading_week2/bloc/task_bloc/task_bloc.dart';
import 'package:borading_week2/bloc/task_bloc/task_event.dart';
import 'package:borading_week2/core/constants/appicons.dart';
import 'package:borading_week2/core/widgets/custom_textfield/rectangle_textfield.dart';
import 'package:borading_week2/models/task.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TaskBottomSheet extends StatelessWidget {
  final TextEditingController taskcontroller;
  final TaskService? taskService;
  final TaskModel? taskModel;

  const TaskBottomSheet({
    super.key,
    required this.taskcontroller,
    this.taskModel,
    this.taskService,
  });

  @override
  Widget build(BuildContext context) {
    final isEdit = taskModel != null;

    // Set initial text if editing
    if (isEdit) {
      taskcontroller.text = taskModel!.taskText;
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              isEdit ? "Edit Task" : 'Add Task',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Textfield
            RectangleTextfield(
              height: 43,
              width: 325,
              hinttext: "Enter a task",
              controller: taskcontroller,
            ),
            const SizedBox(height: 12),
            // Send button
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  final text = taskcontroller.text.trim();
                  if (text.isNotEmpty) {
                    if (isEdit) {
                      // Update task with new text
                      context.read<TaskBloc>().add(
                        UpdateTask(taskModel!.id, text, taskModel!.isCompleted),
                      );
                    } else {
                      // Add new task
                      context.read<TaskBloc>().add(AddTask(text));
                    }

                    taskcontroller.clear();

                    // Close bottom sheet
                    Navigator.pop(context);
                  }
                },
                child: SvgPicture.asset(Appicons.senticonpng),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
