import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/constants/apptextfield.dart';
import 'package:flutter/material.dart';

class CircularTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hinttext;
  const CircularTextField({super.key, this.hinttext = "", this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
