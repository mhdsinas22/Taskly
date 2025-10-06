import 'package:borading_week2/core/constants/apptextfield.dart';
import 'package:flutter/material.dart';

class RectangleTextfield extends StatelessWidget {
  final String hinttext;
  const RectangleTextfield({super.key, this.hinttext = ""});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 272,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hinttext,
          focusedBorder: Apptextfield.squareborder,
          enabledBorder: Apptextfield.squareborder,
        ),
      ),
    );
  }
}
