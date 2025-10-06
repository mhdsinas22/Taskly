import 'package:borading_week2/core/constants/appcolors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(backgroundColor: AppColors.black),
      ),
      body: Column(children: [Row(children: [])]),
    );
  }
}
