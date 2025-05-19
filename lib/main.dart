import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fi_hanouti/app.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(378, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return const MyApp();
      },
    ),
  );
}
