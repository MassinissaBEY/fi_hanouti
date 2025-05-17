import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fi_hanouti/core/constants/app_colors.dart';
import '../widgets/discount_button.dart';

class DiscountMainPage extends StatelessWidget {
  const DiscountMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [

          Image.asset('assets/images/pic.png', fit: BoxFit.cover),

      
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: AppColors.primaryColor),
          ),

          Column(
            children: [
            
              SizedBox(
                height: screenHeight * 0.12,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: const Text(
                    'Instructions',
                    style: TextStyle(color: Colors.white),
                  ),
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
              ),

            
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/logo.png'),
                backgroundColor: Colors.transparent,
              ),

          
              const Spacer(),

           
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  children: [
                    _buildButton(context, 'How do I get discounts?', 'first'),
                    SizedBox(height: screenHeight * 0.02),
                    _buildButton(
                      context,
                      'How do I get loyalty discounts?',
                      'second',
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildButton(
                      context,
                      'How do I get a bonus discount?',
                      'third',
                    ),
                  ],
                ),
              ),

              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, String type) {
    return SizedBox(
      width: double.infinity,
      child: DiscountButton(
        text: text,
        onPressed: () => _navigateToInfoPage(context, type),
      ),
    );
  }

  void _navigateToInfoPage(BuildContext context, String discountType) {
    switch (discountType) {
      case 'first':
        Navigator.pushNamed(context, '/regular-carousel');
        break;
      case 'second':
        Navigator.pushNamed(context, '/loyalty-discount');
        break;
      case 'third':
        Navigator.pushNamed(context, '/bonus-discount');
        break;
    }
  }
}
