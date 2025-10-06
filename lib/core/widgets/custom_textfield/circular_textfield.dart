import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/constants/apptextfield.dart';
import 'package:flutter/material.dart';

class CircularTextField extends StatelessWidget {
  final String hinttext;
  const CircularTextField({super.key, this.hinttext = ""});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColors.onSurface),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.lightGrey),
        fillColor: AppColors.darkGrey, // background color
        filled: true,
        hintText: hinttext,
        focusedBorder: Apptextfield.circularborder,
        enabledBorder: Apptextfield.circularborder,
      ),
    );
  }
}
