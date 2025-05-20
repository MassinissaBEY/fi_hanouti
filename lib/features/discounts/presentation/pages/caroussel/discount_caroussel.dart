import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fi_hanouti/core/constants/app_colors.dart';
import 'package:fi_hanouti/features/discounts/presentation/widgets/step_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showCustomDiscountDialog({
  required BuildContext context,
  required List<Map<String, String>> steps,
  // bool isFullVersion = true,
  required String title,
}) async {
  int currentIndex = 0;

  Future<void> _launchYouTube() async {
    final Uri url = Uri.parse('https://www.youtube.com/@FelHanoutDz/featured');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      print("Impossible d'ouvrir le lien YouTube");
    }
  }

  showDialog(
    context: context,
    // barrierDismissible: false,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            child: Scaffold(
              backgroundColor: AppColors.primaryColor,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text(
                  'Instructions',

                  style: TextStyle(
                    fontSize: 24.sp,
                    height: 1.5,
                    color: Colors.white,
                  ),
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
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
                    SizedBox(height: 8.h),

                    Text(title, textAlign: TextAlign.center),

                    SizedBox(height: 16.h),

                    Expanded(
                      child: Container(
                        // color: Colors.red,
                        width: 265.w,
                        height: 395.h,
                        child: CarouselSlider.builder(
                          key: ValueKey(currentIndex),
                          itemCount: steps.length,
                          itemBuilder: (context, index, _) {
                            return Image.asset(
                              steps[index]['image']!,
                              // fit: BoxFit.cover,
                              width: 265.w,
                            );
                          },
                          options: CarouselOptions(
                            height: 395.h,
                            viewportFraction: 1.0,
                            enableInfiniteScroll: false,
                            initialPage: currentIndex,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          steps[currentIndex]['title'] ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Container(
                      margin: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Text(
                        steps[currentIndex]['description'] ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        steps.length,
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: currentIndex == index ? 12.w : 8.w,
                          height: currentIndex == index ? 12.w : 8.w,
                          decoration: BoxDecoration(
                            color:
                                currentIndex == index
                                    ? Colors.white
                                    : Colors.white54,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            child: CircleAvatar(
                              backgroundColor: AppColors.primaryColorDark,
                              child: GestureDetector(
                                onTap: _launchYouTube,
                                child: Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Image.asset(
                                    'assets/images/youtube_logo.png',
                                    width: 34.w,
                                    height: 34.h,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Row(
                            children: [
                              if (currentIndex != 0 &&
                                  currentIndex != steps.length - 1)
                                AppButton(
                                  text: 'Back',
                                  onPressed: () {
                                    setState(() {
                                      currentIndex--;
                                    });
                                  },
                                  style: AppButtonStyle.outlined,
                                  textColor: Colors.white,
                                  radius: 5.r,
                                ),
                              if (currentIndex != 0 &&
                                  currentIndex != steps.length - 1)
                                SizedBox(width: 10.w),
                              AppButton(
                                text:
                                    currentIndex == steps.length - 1
                                        ? 'Close'
                                        : 'Next',
                                onPressed: () {
                                  if (currentIndex == steps.length - 1) {
                                    Navigator.pop(context);
                                  } else {
                                    setState(() {
                                      currentIndex++;
                                    });
                                  }
                                },
                                style:
                                    currentIndex == steps.length - 1
                                        ? AppButtonStyle.outlined
                                        : AppButtonStyle.filled,
                                backgroundColor:
                                    currentIndex == steps.length - 1
                                        ? Colors.transparent
                                        : Colors.white,
                                textColor:
                                    currentIndex == steps.length - 1
                                        ? Colors.white
                                        : AppColors.primaryColorDark,
                                radius: 5.r,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
