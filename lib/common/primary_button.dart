import 'package:flutter/material.dart';

import '../styles/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String inputText;
  final double height;
  final double width;
  final double radius;

  final VoidCallback? onPressed;

  const PrimaryButton(
      {super.key,
      required this.inputText,
      this.onPressed,
      required this.height,
      required this.width,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: primary),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          inputText,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
