import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  final String text;
  final double fontsize;
  final TextAlign textAlign;
  final TextDecoration? textDecoration;
  final Color color;

  const RegularText({
    super.key,
    required this.text,
    this.fontsize = 16,
    this.textAlign = TextAlign.center,
    this.color = Colors.black,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.w400, // Regular font weight
        color: color,
        decoration: textDecoration,
        decorationColor: AppColors.onSurface,
      ),
      textAlign: textAlign,
    );
  }
}
