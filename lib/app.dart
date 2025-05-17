import 'package:fi_hanouti/features/discounts/presentation/pages/bonus_discount.dart';
import 'package:fi_hanouti/features/discounts/presentation/pages/loyalty_discount.dart';
import 'package:flutter/material.dart';
import 'features/discounts/presentation/pages/discount_main_page.dart';
import 'features/discounts/presentation/pages/discount_info_page.dart';
import 'features/discounts/presentation/pages/caroussel/car.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discount App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const DiscountMainPage(),
        '/discount-info': (context) => const DiscountInfoPage(),
        '/regular-carousel': (context) => CarrouselPage(),
        '/bonus-discount': (context) => const BonusDiscountPage(),
        '/loyalty-discount': (context) => const LoyaltyDiscountPage(),
      },
    );
  }
}
