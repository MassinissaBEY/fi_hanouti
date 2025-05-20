import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/discounts/presentation/pages/welcomepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(378, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Discount App',
          theme: ThemeData(
            fontFamily: 'Poppins',
            textTheme: TextTheme(
              headlineSmall: TextStyle(
                fontSize: 16.sp, 
                fontWeight: FontWeight.w500, 
                height: 1.75, 
                letterSpacing: 0.0,
                color: Colors.white
              ),
            ),
            // primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const WelcomePage(),
            // '/discount-main': (context) => const DiscountMainPage(),
            // '/bonus-discount': (context) => const BonusDiscountPage(),
            // '/loyalty-discount': (context) => const LoyaltyDiscountPage(),
          },
        );
      },
    );
  }
}
