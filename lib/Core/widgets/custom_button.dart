import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      this.borderradius,
      required this.text,
      required this.style, this.onPressed});

  final Color backgroundColor;
  final String text;
  final BorderRadius? borderradius;
  final TextStyle style;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: borderradius ?? BorderRadius.circular(12),
              )),
          child: Text(
            text,
            style: style,
          )),
    );
  }
}
