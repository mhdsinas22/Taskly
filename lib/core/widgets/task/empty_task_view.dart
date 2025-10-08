import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/constants/appicons.dart';
import 'package:borading_week2/core/widgets/emptytextmessges.dart';
import 'package:flutter/material.dart';

class EmptyTaskView extends StatelessWidget {
  const EmptyTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(color: AppColors.lightGrey, width: 360, height: 1),
          SizedBox(height: 50),
          Image.asset(Appicons.clipboardiconpng),
          SizedBox(height: 10),
          EmptyTaskMessage(),
        ],
      ),
    );
  }
}
