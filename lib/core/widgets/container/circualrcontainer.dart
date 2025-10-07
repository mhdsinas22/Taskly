import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:flutter/material.dart';

class Circualrcontainer extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Widget child;
  final bool needborder;
  const Circualrcontainer({
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
                color: backgroundColor,
                border: Border.all(color: AppColors.onSurface),
                borderRadius: BorderRadius.circular(10),
              )
              : BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(999),
              ),
      child: child,
    );
  }
}
