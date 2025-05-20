import 'dart:ui';
import 'package:fi_hanouti/core/constants/constants.dart';
import 'package:fi_hanouti/features/discounts/presentation/pages/caroussel/discount_caroussel.dart';
import 'package:flutter/material.dart';
import 'package:fi_hanouti/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/menu_buttons.dart';

void showDiscountDialog(BuildContext context) {
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
            color: AppColors.primaryColorDark,
            child: Column(
              children: [
                SizedBox(
                  height: 62.h,
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
                        fontSize: 24.sp,
                        height: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    iconTheme: const IconThemeData(color: Colors.white),
                  ),
                ),
                Container(
                  width: 56.w,
                  height: 57.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const Spacer(),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final map = menuList[index];
                        return DiscountButton(
                          text: map['title'],
                          onPressed:
                              () => showCustomDiscountDialog(
                                context: context,
                                steps: map['contect'],
                                // isFullVersion: true,
                                title: menuList[index]['title'],
                              ),
                        );
                      },
                      separatorBuilder:
                          (context, index) => SizedBox(height: 16.h),
                      itemCount: menuList.length,
                    ),
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

// Widget _buildButton(BuildContext context, Map<String, dynamic> map) {
//   return 
//     // width: 335.w,
//     // height: 54.h,
//      DiscountButton(
//       text: map['title'],
//       onPressed:
//           () => showCustomDiscountDialog(
//             context: context,
//             steps: map['contect'],
//             isFullVersion: true,
//             title: 'How do I get discounts?',
//           ),
    
//   );
// }
