import 'package:fi_hanouti/features/discounts/presentation/pages/welcomepage.dart';
import 'package:flutter/material.dart';
import 'features/discounts/presentation/pages/discount_main_page.dart';

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
        '/': (context) => WelcomePage(),
        // '/': (context) => const DiscountMainPage(),
        // '/bonus-discount': (context) => const BonusDiscountPage(),
        // '/loyalty-discount': (context) => const LoyaltyDiscountPage(),
      },
    );
  }
}
