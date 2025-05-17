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
    
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

   
    final double fontSize = screenWidth * 0.042; 
    final double verticalPadding = screenHeight * 0.018;
    final double horizontalPadding = screenWidth * 0.08;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(82, 255, 255, 255).withOpacity(0.35),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color.fromARGB(93, 255, 255, 255).withOpacity(0.1),
            ),
          ),
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: fontSize),
            ),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
