import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/widgets/container/circualrcontainer.dart';
import 'package:borading_week2/core/widgets/texts/semibold.dart';
import 'package:borading_week2/models/task.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:borading_week2/core/widgets/custom_button/circular_button.dart';
import 'package:borading_week2/core/widgets/custom_textfield/circular_textfield.dart';
import 'package:borading_week2/core/widgets/texts/boldtext.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskcontrller = TextEditingController();
    final TaskService taskService = TaskService();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF121212), // dark background
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.2,
              decoration: BoxDecoration(color: AppColors.black),
            ),
            Column(
              children: [
                SizedBox(height: 120),
                // 🔝 Top Search + Add
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.02,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CircularTextField(hinttext: "🚀 Search..."),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      CircularButton(
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.06,
                        onPressed: () async {
                          final task = taskcontrller.text.trim();
                          if (task.isNotEmpty) {
                            print("task$task");
                            await taskService.addTask(task);
                            taskcontrller.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Task added!')),
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BoldText(
                              text: "Add",
                              fontsize: screenWidth * 0.035,
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Icon(
                              Icons.add_circle_outline,
                              size: screenWidth * 0.04,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SemiBold(
                            text: "Pending",
                            fontsize: 14,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(width: 5),
                          Circualrcontainer(
                            width: 22,
                            height: 19,
                            backgroundColor: AppColors.darkGrey,
                            child: Center(
                              child: SemiBold(text: "1", fontsize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SemiBold(
                            text: "Completed",
                            fontsize: 14,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(width: 5),
                          Circualrcontainer(
                            width: 40,
                            height: 19,
                            backgroundColor: AppColors.darkGrey,
                            child: Center(
                              child: SemiBold(text: "1/2", fontsize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<TaskModel>>(
                    stream: taskService.tasksStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(
                            "No tasks yet",
                            style: TextStyle(color: Colors.white70),
                          ),
                        );
                      }

                      final tasks = snapshot.data!;

                      return ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          var todo = tasks[index];
                          return ListTile(
                            title: Text(
                              todo.tasktext,
                              style: TextStyle(
                                color: Colors.white,
                                decoration:
                                    todo.iscomplted
                                        ? TextDecoration.lineThrough
                                        : null,
                              ),
                            ),
                            trailing: Checkbox(
                              value: todo.iscomplted,
                              onChanged: (value) {
                                taskService.updateTask(
                                  todo.id,
                                  value as String,
                                );
                              },
                            ),
                            onLongPress: () {
                              taskService.deleteTask(todo.id);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                CircularTextField(
                  hinttext: "Enter a task",
                  controller: taskcontrller,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
