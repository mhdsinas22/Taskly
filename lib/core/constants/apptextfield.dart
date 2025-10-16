import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:flutter/material.dart';

class Apptextfield {
  static OutlineInputBorder circularborder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10),
  );
  static OutlineInputBorder squareborder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.onSurface, width: 1),
  );
}
