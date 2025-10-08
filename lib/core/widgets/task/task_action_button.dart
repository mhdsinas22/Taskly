import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskActionButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;

  const TaskActionButton({
    super.key,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(iconPath, width: 16, height: 16),
    );
  }
}
