import 'package:borading_week2/core/constants/apptextfield.dart';
import 'package:flutter/material.dart';

class RectangleTextfield extends StatelessWidget {
  final String hinttext;
  final double width;
  final double height;
  const RectangleTextfield({
    super.key,
    this.hinttext = "",
    this.width = 272,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
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
