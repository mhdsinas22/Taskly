import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:flutter/material.dart';

class EmptyTaskMessage extends StatelessWidget {
  const EmptyTaskMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You don’t have any tasks yet.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600, // bold like in the image
              color: AppColors.lightGrey,
            ),
            textAlign: TextAlign.center,
          ),

          Text(
            "Start adding tasks and manage your\ntime effectively.",
            style: TextStyle(
              fontSize: 14,
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.6),
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
