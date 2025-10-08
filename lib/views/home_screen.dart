import 'package:borading_week2/bloc/task_bloc/task_bloc.dart';
import 'package:borading_week2/bloc/task_bloc/task_event.dart';
import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/widgets/custom_button/circular_button.dart';
import 'package:borading_week2/core/widgets/custom_textfield/circular_textfield.dart';
import 'package:borading_week2/core/widgets/task/task_bottom_sheet.dart';
import 'package:borading_week2/core/widgets/task/task_list_view.dart';
import 'package:borading_week2/core/widgets/task/task_status_row.dart';
import 'package:borading_week2/core/widgets/texts/boldtext.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final TaskService taskService;
  const HomeScreen({super.key, required this.taskService});

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskController = TextEditingController();
    final TextEditingController serachcontorller = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Scaling factors (you can adjust based on your design)
    double paddingHorizontal = screenWidth * 0.04;
    double paddingVertical = screenHeight * 0.02;
    double buttonHeight = screenHeight * 0.06;
    double buttonWidth = screenWidth * 0.25;
    double topSpacing = screenHeight * 0.15;
    double fontSizeSmall = screenWidth * 0.035;
    double fontSizeCount = screenWidth * 0.03;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Stack(
          children: [
            // Top background
            Container(
              width: double.infinity,
              height: screenHeight * 0.2,
              decoration: BoxDecoration(color: AppColors.black),
            ),
            Column(
              children: [
                SizedBox(height: topSpacing),
                // 🔝 Top Search + Add
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingHorizontal,
                    vertical: paddingVertical,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CircularTextField(
                          hinttext: "🚀 Search...",
                          controller: serachcontorller,
                          onChanged: (value) {
                            context.read<TaskBloc>().add(SearchTasks(value));
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      CircularButton(
                        width: buttonWidth,
                        height: buttonHeight,
                        onPressed: () async {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.grey[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(screenWidth * 0.05),
                              ),
                            ),
                            builder:
                                (context) => BlocProvider.value(
                                  value: BlocProvider.of<TaskBloc>(context),
                                  child: TaskBottomSheet(
                                    taskcontroller: taskController,
                                    taskService: taskService,
                                  ),
                                ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BoldText(text: "Add", fontsize: fontSizeSmall),
                            SizedBox(width: screenWidth * 0.01),
                            Icon(Icons.add_circle_outline, size: fontSizeSmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Pending + Completed row
                TaskStatusRow(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  fontSizeSmall: fontSizeSmall,
                  fontSizeCount: fontSizeCount,
                  paddingHorizontal: paddingHorizontal,
                  paddingVertical: paddingVertical,
                ),
                // Task List
                TaskListView(
                  serachcontroller: serachcontorller,
                  taskService: taskService,
                  taskcontroller: taskController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
