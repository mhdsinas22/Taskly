import 'package:flutter/material.dart';

class LightFont extends StatelessWidget {
  final String text;
  final double fontsize;
  final TextAlign textAlign;
  final Color color;
  const LightFont({
    super.key,
    this.fontsize = 14,
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
        fontWeight: FontWeight.w300,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
