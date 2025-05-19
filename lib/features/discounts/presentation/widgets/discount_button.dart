import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final double buttonWidth = 335.w;
    final double buttonHeight = 54.h;

    return ClipRRect(
      borderRadius: BorderRadius.circular(26.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            color: const Color(0x33FFFFFF), 
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(
              color: const Color(0x19FFFFFF), 
            ),
          ),
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: Colors.white,
              textStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                height: 1.75, 
                letterSpacing: 0,
              
              ),
            ),
            child: Center(child: Text(text)),
          ),
        ),
      ),
    );
  }
}
