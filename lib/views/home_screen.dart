import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/widgets/container/circualrcontainer.dart';
import 'package:borading_week2/core/widgets/task/task_list_view.dart';
import 'package:borading_week2/core/widgets/task/task_bottom_sheet.dart';
import 'package:borading_week2/core/widgets/texts/semibold.dart';
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
                          // Bottom sheet or modal structure
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.grey[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder:
                                (context) => TaskBottomSheet(
                                  taskcontroller: taskcontrller,
                                  taskService: taskService,
                                ),
                          );
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
                TaskListView(
                  taskService: taskService,
                  taskcontroller: taskcontrller,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
