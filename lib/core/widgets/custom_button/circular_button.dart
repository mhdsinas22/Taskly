import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Color backgroundcolor;
  final VoidCallback onPressed;
  final Color forgroundcolor;
  final Widget child;
  final double height;
  final double width;
  const CircularButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundcolor = AppColors.primaryColor,
    this.forgroundcolor = AppColors.onSurface,
    this.width = 272,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          foregroundColor: forgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: child,
      ),
    );
  }
}
