import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AppButtonStyle { filled, outlined, glass }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final AppButtonStyle style;
  final Color? backgroundColor;
  final Color? textColor;
  final double radius;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style = AppButtonStyle.filled,
    this.backgroundColor,
    this.textColor,
    this.radius = 4,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontFamily: 'Public Sans',
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      height: 1.5, // Line height 24px
      letterSpacing: 0,
      color: textColor ?? Colors.black,
    );

    final padding = EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.5.h);

    switch (style) {
      case AppButtonStyle.filled:
        return SizedBox(
          width: 80.w,
          height: 37.h,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? Colors.white,
              foregroundColor: textColor ?? Colors.black,
              padding: padding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius.r),
              ),
            ),
            child: Text(text, style: textStyle),
          ),
        );

      case AppButtonStyle.outlined:
        return SizedBox(
          width: 80.w,
          height: 37.h,
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: textColor ?? Colors.white,
              side: BorderSide(color: textColor ?? Colors.white),
              padding: padding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius.r),
              ),
            ),
            child: Text(text, style: textStyle),
          ),
        );

      case AppButtonStyle.glass:
        return SizedBox(
          width: 80.w,
          height: 37.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(radius.r),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: TextButton(
                  onPressed: onPressed,
                  style: TextButton.styleFrom(
                    foregroundColor: textColor ?? Colors.white,
                    padding: padding,
                  ),
                  child: Text(text, style: textStyle),
                ),
              ),
            ),
          ),
        );
    }
  }
}
