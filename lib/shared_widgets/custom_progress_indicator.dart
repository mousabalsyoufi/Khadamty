import 'package:flutter/material.dart';


class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
