import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:flutter/material.dart';

class Rectanglecontainer extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Widget child;
  final bool needborder;
  const Rectanglecontainer({
    super.key,
    this.backgroundColor = AppColors.darkGrey,
    required this.child,
    this.height = 400,
    this.width = 382,
    this.needborder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:
          needborder
              ? BoxDecoration(
                border: Border.all(color: AppColors.darkGrey),
                borderRadius: BorderRadius.circular(10),
              )
              : BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(0),
              ),
      child: child,
    );
  }
}
