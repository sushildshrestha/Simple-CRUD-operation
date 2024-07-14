import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  CustomButtons({super.key, required this.onPressed, required this.child});

  void Function()? onPressed;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
    );
  }
}
