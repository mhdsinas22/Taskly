import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/widgets/custom_button/circular_button.dart';
import 'package:borading_week2/core/widgets/custom_textfield/circular_textfield.dart';
import 'package:borading_week2/core/widgets/texts/boldtext.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // screen width & height edukkan
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.2), // 20% screen height
        child: AppBar(
          backgroundColor: AppColors.black,
          title: Text(
            "Home",
            style: TextStyle(fontSize: screenWidth * 0.05),
          ), // responsive title
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: CircularTextField(hinttext: "🚀  Search...")),
                SizedBox(width: screenWidth * 0.02), // gap
                CircularButton(
                  width: screenWidth * 0.25, // responsive width
                  height: screenHeight * 0.06, // responsive height
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //bold text
                      BoldText(text: "Add", fontsize: screenWidth * 0.035),
                      SizedBox(width: screenWidth * 0.01),
                      Icon(Icons.add_circle_outline, size: screenWidth * 0.04),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
