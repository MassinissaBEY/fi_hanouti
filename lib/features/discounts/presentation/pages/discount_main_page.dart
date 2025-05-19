import 'dart:ui';
import 'package:fi_hanouti/core/constants/constants.dart';
import 'package:fi_hanouti/features/discounts/presentation/pages/caroussel/discount_caroussel.dart';
import 'package:flutter/material.dart';
import 'package:fi_hanouti/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/discount_button.dart';

void showDiscountDialog(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    builder: (_) {
      return Material(
        color: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Container(
            height: double.infinity,
            width: double.infinity,

           
            color: AppColors.primaryColorDark,

            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.12,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    leading: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    title: Text(
                      'Instructions',
                      style: TextStyle(
                        fontFamily: 'Poppins', 
                        fontWeight: FontWeight.w500, 
                        fontSize:
                            24.sp, 
                        height: 1.5,
                        letterSpacing: 0,
                        color: Colors.white, 
                      ),
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
          ),
        ),
      );
    },
  );
}

Widget _buildButton(BuildContext context, String text, String type) {
  return SizedBox(
    width: double.infinity,
    child: DiscountButton(
      text: text,
      onPressed: () {
        switch (type) {
          case 'first':
            showCustomDiscountDialog(
              context: context,
              steps: fullStepsList,
              isFullVersion: true,
              title: 'How do I get discounts?',
            );
            break;
          case 'second':
            showCustomDiscountDialog(
              context: context,
              steps: loyaltyStepsList,
              isFullVersion: false,
              title: 'How do I get loyalty discounts?',
            );
            break;
          case 'third':
            showCustomDiscountDialog(
              context: context,
              steps: bonusStepsList,
              isFullVersion: false,
              title: 'How do I get a bonus discount?',
            );
            break;
        }
      },
    ),
  );
}
