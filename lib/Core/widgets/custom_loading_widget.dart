import 'package:flutter/material.dart';

class CustomLoadingWidgets extends StatelessWidget {
  const CustomLoadingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}