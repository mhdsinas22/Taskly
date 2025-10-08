import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/constants/apptextfield.dart';
import 'package:flutter/material.dart';

class RectangleTextfield extends StatelessWidget {
  final String hinttext;
  final double width;
  final double height;
  final TextEditingController? controller;
  const RectangleTextfield({
    super.key,
    this.hinttext = "",
    this.width = 272,
    this.height = 40,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        style: TextStyle(color: AppColors.onSurface),
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.onSurface),
          ),
          hintText: hinttext,
          focusedBorder: Apptextfield.squareborder,
          enabledBorder: Apptextfield.squareborder,
        ),
      ),
    );
  }
}
