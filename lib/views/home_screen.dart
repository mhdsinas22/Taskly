import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/constants/appicons.dart';
import 'package:borading_week2/core/widgets/container/circualrcontainer.dart';
import 'package:borading_week2/core/widgets/container/rectanglecontainer.dart';
import 'package:borading_week2/core/widgets/emptytextmessges.dart';
import 'package:borading_week2/core/widgets/texts/regular_text.dart';
import 'package:borading_week2/core/widgets/texts/semibold.dart';
import 'package:borading_week2/models/task.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:borading_week2/core/widgets/custom_button/circular_button.dart';
import 'package:borading_week2/core/widgets/custom_textfield/circular_textfield.dart';
import 'package:borading_week2/core/widgets/texts/boldtext.dart';
import 'package:flutter_svg/svg.dart';

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
                            await taskService.addTask(task);
                            taskcontrller.clear();
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
                          StreamBuilder<int>(
                            stream: taskService.pendingTasksCountStream(),
                            initialData: 0, // <-- initial value
                            builder: (context, snapshot) {
                              final count = snapshot.data ?? 0;
                              return Circualrcontainer(
                                width: 22,
                                height: 19,
                                backgroundColor: AppColors.darkGrey,
                                child: Center(
                                  child: SemiBold(
                                    text: count.toString(),
                                    fontsize: 12,
                                  ),
                                ),
                              );
                            },
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
                          child: Column(
                            children: [
                              Container(
                                color: AppColors.lightGrey,
                                width: 360,
                                height: 1,
                              ),
                              SizedBox(height: 50),
                              Image.asset(Appicons.clipboardiconpng),
                              SizedBox(height: 10),
                              EmptyTaskMessage(),
                            ],
                          ),
                        );
                      }
                      final tasks = snapshot.data!;
                      return ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          var todo = tasks[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Rectanglecontainer(
                              width: 390,
                              height: 72,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap:
                                              () => taskService.setCompleted(
                                                todo.id,
                                                todo.iscomplted ? false : true,
                                              ),
                                          child:
                                              todo.iscomplted == true
                                                  ? Circualrcontainer(
                                                    backgroundColor:
                                                        AppColors.primaryColor,
                                                    height: 16,
                                                    width: 16.39,

                                                    child: Center(
                                                      child: Icon(
                                                        color:
                                                            AppColors.onSurface,
                                                        Icons.done,
                                                        size: 10,
                                                      ),
                                                    ),
                                                  )
                                                  : Circualrcontainer(
                                                    height: 16,
                                                    width: 16.39,
                                                    needborder: true,
                                                    child: Text(""),
                                                  ),
                                        ),
                                        SizedBox(width: 10),
                                        RegularText(
                                          text: todo.tasktext,
                                          color: AppColors.onSurface,
                                          textDecoration:
                                              todo.iscomplted
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Appicons.editiconsvg,
                                          width: 16,
                                          height: 16,
                                        ),
                                        SizedBox(width: 5),
                                        InkWell(
                                          onTap:
                                              () => taskService.deleteTask(
                                                todo.id,
                                              ),
                                          child: SvgPicture.asset(
                                            Appicons.deleteiconsvg,
                                            width: 16,
                                            height: 16,
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
