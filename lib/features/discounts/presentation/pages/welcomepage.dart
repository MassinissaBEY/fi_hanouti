import 'package:flutter/material.dart';
import 'discount_main_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDiscountDialog(context);
          },
          child: const Text('Show Instructions'),
        ),
      ),
    );
  }
}
