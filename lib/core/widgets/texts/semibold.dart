import 'package:flutter/material.dart';

class SemiBold extends StatelessWidget {
  final String text;
  final double fontsize;
  final TextAlign textAlign;
  final Color color;
  const SemiBold({
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
        fontWeight: FontWeight.w600,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
