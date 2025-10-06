import 'package:flutter/material.dart';
import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/widgets/custom_button/circular_button.dart';
import 'package:borading_week2/core/widgets/custom_textfield/circular_textfield.dart';
import 'package:borading_week2/core/widgets/texts/boldtext.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF121212), // dark background
      body: SafeArea(
        child: Column(
          children: [
            // 🔝 Top Search + Add
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: Row(
                children: [
                  Expanded(child: CircularTextField(hinttext: "🚀 Search...")),
                  SizedBox(width: screenWidth * 0.02),
                  CircularButton(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.06,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoldText(text: "Add", fontsize: screenWidth * 0.035),
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

            // 🔘 Tabs: Pending / Completed
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BoldText(text: "Pending", fontsize: screenWidth * 0.04),
                      SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: BoldText(
                          text: "1",
                          fontsize: screenWidth * 0.03,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      BoldText(text: "Completed", fontsize: screenWidth * 0.04),
                      SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: BoldText(
                          text: "1 / 2",
                          fontsize: screenWidth * 0.03,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            // ✅ Task List
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                children: [
                  // Pending Task
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.circle_outlined,
                        color: Colors.white70,
                      ),
                      title: const Text(
                        "Do Math Homework",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.edit, color: Colors.white70),
                          SizedBox(width: 12),
                          Icon(Icons.delete_outline, color: Colors.white70),
                        ],
                      ),
                    ),
                  ),

                  // Completed Task
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.blue,
                      ),
                      title: const Text(
                        "Do Math Homework",
                        style: TextStyle(
                          color: Colors.white70,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.edit, color: Colors.white70),
                          SizedBox(width: 12),
                          Icon(Icons.delete_outline, color: Colors.white70),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
