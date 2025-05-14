import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fi_hanouti/core/constants/app_colors.dart';
import 'package:fi_hanouti/features/bloc/discount_bloc.dart';
import '../widgets/discount_button.dart';

class DiscountMainPage extends StatelessWidget {
  const DiscountMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
        
          Image.asset(
            'assets/images/pic.png', 
            fit: BoxFit.cover,
          ),

          
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: AppColors.primaryColor),
          ),

       
          Column(
            children: [
            
              AppBar(
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

              const SizedBox(height: 20),

              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(
                  'assets/images/logo.png',
                ), // ton logo
                backgroundColor: Colors.transparent,
              ),

              const Spacer(),

              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildButton(
                      context,
                      'How do I get discounts?',
                      'Regular Discounts',
                    ),
                    const SizedBox(height: 20),
                    _buildButton(
                      context,
                      'How do I get loyalty discounts?',
                      'Loyalty Discounts',
                    ),
                    const SizedBox(height: 20),
                    _buildButton(
                      context,
                      'How do I get a bonus discount?',
                      'Bonus Discounts',
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
    context.read<DiscountBloc>().add(LoadDiscountInfo(discountType));
    Navigator.pushNamed(context, '/discount-info');
  }
}
