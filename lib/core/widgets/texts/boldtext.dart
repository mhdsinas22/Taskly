import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  final double fontsize;
  final TextAlign textAlign;
  final Color color;
  const BoldText({
    super.key,
    this.fontsize = 20,
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
        fontWeight: FontWeight.bold,
        color: color,
        fontFamily: "Manjari",
      ),
      textAlign: textAlign,
    );
  }
}
