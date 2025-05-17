import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fi_hanouti/core/constants/app_colors.dart';
import 'package:fi_hanouti/features/discounts/presentation/widgets/app_button.dart';

class BonusDiscountPage extends StatelessWidget {
  const BonusDiscountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🖼️ Image de fond
          Image.asset('assets/images/pic.png', fit: BoxFit.cover),

          // 🎨 Couleur + flou
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: AppColors.primaryColor),
          ),

          SafeArea(
            child: Column(
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

                const SizedBox(height: 12),

                // Logo
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  backgroundColor: Colors.transparent,
                ),

                const SizedBox(height: 8),

                // Titre
                Text(
                  'How do I get discounts?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/bonus.png',
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),

          
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Text(
                    "When you order 5 times from any restaurant on FelHanout app, you'll get a discount on the fifth. Track your progress and rewards on the home page.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.042,
                      height: 1.5,
                    ),
                  ),
                ),

            
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AppButton(
                      text: 'Close',
                      onPressed: () => Navigator.pop(context),
                      style: AppButtonStyle.outlined,
                      textColor: Colors.white,
                      radius: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
