import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  final String text;
  final double fontsize;
  final TextAlign textAlign;
  final Color color;
  const MediumText({
    super.key,
    this.fontsize = 16,
    required this.text,
    this.textAlign = TextAlign.center,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
