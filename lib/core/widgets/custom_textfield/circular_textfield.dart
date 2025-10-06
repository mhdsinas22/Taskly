import 'package:flutter/material.dart';

class CircularTextField extends StatelessWidget {
  final String hinttext;
  const CircularTextField({super.key, this.hinttext = ""});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hinttext,
        focusedBorder: Apptextfield.squareborder,
        enabledBorder: Apptextfield.squareborder,
      ),
    );
  }
}
