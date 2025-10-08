import 'package:borading_week2/core/constants/appicons.dart';
import 'package:borading_week2/core/widgets/custom_textfield/rectangle_textfield.dart';
import 'package:borading_week2/models/task.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskBottomSheet extends StatelessWidget {
  final TextEditingController taskcontroller;
  final TaskService taskService;
  final TaskModel? taskModel;
  const TaskBottomSheet({
    super.key,
    required this.taskcontroller,
    this.taskModel,
    required this.taskService,
  });

  @override
  Widget build(BuildContext context) {
    final isEdit = taskModel != null;
    if (isEdit) {
      taskcontroller.text = taskModel!.tasktext;
    }
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              isEdit ? "Edit Task" : 'Add Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            RectangleTextfield(
              height: 43,
              width: 325,
              hinttext: "Enter a task",
              controller: taskcontroller,
            ),
            // Text field
            SizedBox(height: 12),
            // Send button (right-aligned)
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () async {
                  final text = taskcontroller.text.trim();
                  if (text.isNotEmpty) {
                    if (isEdit) {
                      await taskService.updateTask(taskModel!.id, text);
                    } else {
                      await taskService.addTask(text);
                    }
                    taskcontroller.clear();
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
