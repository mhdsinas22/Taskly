import 'package:borading_week2/bloc/task_bloc/task_bloc.dart';
import 'package:borading_week2/bloc/task_bloc/task_event.dart';
import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/constants/appicons.dart';
import 'package:borading_week2/core/widgets/container/circualrcontainer.dart';
import 'package:borading_week2/core/widgets/task/task_action_button.dart';
import 'package:borading_week2/core/widgets/task/task_checkbox.dart';
import 'package:borading_week2/core/widgets/task/task_bottom_sheet.dart';
import 'package:borading_week2/core/widgets/texts/regular_text.dart';
import 'package:borading_week2/models/task.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskTile extends StatelessWidget {
  final TaskModel taskModel;
  final TaskService taskService;
  final TextEditingController taskcontroller;
  const TaskTile({
    super.key,
    required this.taskService,
    required this.taskModel,
    required this.taskcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Circualrcontainer(
        borderradius: 4,
        marign: const EdgeInsets.symmetric(horizontal: 16),
        width: 390,
        height: 72,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TaskCheckbox(
                    isCompleted: taskModel.isCompleted,
                    onTap:
                        () => context.read<TaskBloc>().add(
                          ToggleTaskCompletion(
                            taskModel.id,
                            !taskModel.isCompleted,
                          ),
                        ),
                  ),
                  SizedBox(width: 10),
                  RegularText(
                    text: taskModel.taskText,
                    color: AppColors.onSurface,
                    textDecoration:
                        taskModel.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                  ),
                ],
              ),
              Row(
                children: [
                  TaskActionButton(
                    iconPath: Appicons.editiconsvg,
                    onTap:
                        () => showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          backgroundColor: AppColors.darkGrey,
                          context: context,
                          builder: (context) {
                            return TaskBottomSheet(
                              taskModel: taskModel,
                              taskcontroller: taskcontroller,
                              taskService: taskService,
                            );
                          },
                        ),
                  ),

                  SizedBox(width: 5),
                  TaskActionButton(
                    iconPath: Appicons.deleteiconsvg,
                    onTap:
                        () => context.read<TaskBloc>().add(
                          DeleteTask(taskModel.id),
                        ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
