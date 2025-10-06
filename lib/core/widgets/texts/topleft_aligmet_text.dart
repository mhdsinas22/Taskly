import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:borading_week2/core/widgets/texts/regular_text.dart';
import 'package:flutter/material.dart';

class TopleftAligmetText extends StatelessWidget {
  final String text;
  const TopleftAligmetText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: RegularText(
          text: text,
          fontsize: 14,
          color: AppColors.onSurface,
        ),
      ),
    );
  }
}
