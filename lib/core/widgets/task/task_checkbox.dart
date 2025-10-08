import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/widgets/container/circualrcontainer.dart';
import 'package:flutter/material.dart';

class TaskCheckbox extends StatelessWidget {
  final bool isCompleted;
  final VoidCallback onTap;
  const TaskCheckbox({
    super.key,
    required this.isCompleted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child:
          isCompleted
              ? Circualrcontainer(
                backgroundColor: AppColors.primaryColor,
                height: 16,
                width: 16.39,
                child: const Center(
                  child: Icon(color: AppColors.onSurface, Icons.done, size: 10),
                ),
              )
              : Circualrcontainer(
                height: 16,
                width: 16.39,
                needborder: true,
                child: Text(""),
              ),
    );
  }
}
