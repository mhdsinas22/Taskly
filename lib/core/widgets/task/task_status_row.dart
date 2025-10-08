import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:borading_week2/bloc/task_bloc/task_bloc.dart';
import 'package:borading_week2/bloc/task_bloc/task_state.dart';
import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/widgets/container/circualrcontainer.dart';
import 'package:borading_week2/core/widgets/texts/semibold.dart';

class TaskStatusRow extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final double fontSizeSmall;
  final double fontSizeCount;
  final double paddingHorizontal;
  final double paddingVertical;

  const TaskStatusRow({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.fontSizeSmall,
    required this.fontSizeCount,
    required this.paddingHorizontal,
    required this.paddingVertical,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          int pending = 0;
          int completed = 0;

          if (state is TaskLoaded) {
            pending = state.tasks.where((t) => !t.iscomplted).length;
            completed = state.tasks.where((t) => t.iscomplted).length;
          }

          int total = pending + completed;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Pending
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  _buildStatusItem(
                    label: "Pending",
                    count: pending.toString(),
                    width: screenWidth * 0.06,
                    height: screenHeight * 0.025,
                    fontSizeLabel: fontSizeSmall,
                    fontSizeCount: fontSizeCount,
                  ),
                ],
              ),

              // Completed
              Row(
                children: [
                  _buildStatusItemLeftSide(
                    label: "Completed",
                    count: total == 0 ? "0" : "$completed/$total",
                    width: screenWidth * 0.09,
                    height: screenHeight * 0.025,
                    fontSizeLabel: fontSizeSmall,
                    fontSizeCount: fontSizeCount,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatusItem({
    required String label,
    required String count,
    required double width,
    required double height,
    required double fontSizeLabel,
    required double fontSizeCount,
  }) {
    return Row(
      children: [
        SemiBold(
          text: label,
          fontsize: fontSizeLabel,
          color: AppColors.skyblue,
        ),
        SizedBox(width: screenWidth * 0.01),
        Circualrcontainer(
          width: width,
          height: height,
          backgroundColor: AppColors.darkGrey,
          child: Center(child: SemiBold(text: count, fontsize: fontSizeCount)),
        ),
      ],
    );
  }

  Widget _buildStatusItemLeftSide({
    required String label,
    required String count,
    required double width,
    required double height,
    required double fontSizeLabel,
    required double fontSizeCount,
  }) {
    return Row(
      children: [
        SemiBold(
          text: label,
          fontsize: fontSizeLabel,
          color: AppColors.primaryColor,
        ),
        SizedBox(width: screenWidth * 0.01),
        Circualrcontainer(
          width: width,
          height: height,
          backgroundColor: AppColors.darkGrey,
          child: Center(child: SemiBold(text: count, fontsize: fontSizeCount)),
        ),
      ],
    );
  }
}
