import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:flutter/material.dart';

class Circualrcontainer extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Widget child;
  final bool needborder;
  final double borderradius;
  final EdgeInsetsGeometry? marign;
  const Circualrcontainer({
    super.key,
    this.backgroundColor = AppColors.darkGrey,
    required this.child,
    this.height = 400,
    this.width = 382,
    this.needborder = false,
    this.marign,
    this.borderradius = 999,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marign,
      width: width,
      height: height,
      decoration:
          needborder
              ? BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: AppColors.onSurface),
                borderRadius: BorderRadius.circular(borderradius),
              )
              : BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(borderradius),
              ),
      child: child,
    );
  }
}
