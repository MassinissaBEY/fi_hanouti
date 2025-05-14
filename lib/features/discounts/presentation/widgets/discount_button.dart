import 'dart:ui';
import 'package:flutter/material.dart';

class DiscountButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DiscountButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30), // même forme qu’avant
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // flou plus fort
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(
              82,
              255,
              255,
              255,
            ).withOpacity(0.35), // transparent clair
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color.fromARGB(93, 255, 255, 255).withOpacity(0.1),
            ),
          ),
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
