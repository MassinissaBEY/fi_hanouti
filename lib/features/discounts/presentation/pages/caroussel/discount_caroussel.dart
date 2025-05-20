import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fi_hanouti/core/constants/app_colors.dart';
import 'package:fi_hanouti/features/discounts/presentation/widgets/app_button.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showCustomDiscountDialog({
  required BuildContext context,
  required List<Map<String, String>> steps,
  bool isFullVersion = true,
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
    barrierDismissible: false,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            child: Scaffold(
              backgroundColor: AppColors.primaryColor,
              appBar: AppBar(
                backgroundColor: AppColors.primaryColor,
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
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    height: 1.5,
                    letterSpacing: 0,
                    color: Colors.white,
                  ),
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 28.r,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    if (isFullVersion)
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          height: 1.75,
                          letterSpacing: 0,
                        ),
                        textAlign: TextAlign.center,
                      ),

                    SizedBox(height: isFullVersion ? 16.h : 8.h),

                    Expanded(
                      child: Center(
                        child: Container(
                          width: 265.w,
                          height: 395.h,
                          child:
                              isFullVersion
                                  ? CarouselSlider.builder(
                                    key: ValueKey(currentIndex),
                                    itemCount: steps.length,
                                    itemBuilder: (context, index, _) {
                                      return Image.asset(
                                        steps[index]['image']!,
                                        fit: BoxFit.contain,
                                        width: double.infinity,
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
                                  )
                                  : Image.asset(
                                    steps[currentIndex]['image']!,
                                    width: 265.w,
                                    height: 395.h,
                                    fit: BoxFit.contain,
                                  ),
                        ),
                      ),
                    ),

                    SizedBox(height: isFullVersion ? 20.h : 16.h),

                    if (isFullVersion)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            steps[currentIndex]['title'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),

                    SizedBox(height: isFullVersion ? 8.h : 30.h),

                    Container(
                      // color: Colors.red,
                      width: 335.w,
                      height: isFullVersion ? 56.h : 113.h,
                      child: Text(
                        steps[currentIndex]['description'] ?? '',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          height: 1.75,
                          letterSpacing: 0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    if (isFullVersion)
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
                          if (isFullVersion)
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
                            )
                          else
                            SizedBox(width: 50.w),

                          if (isFullVersion)
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
                            )
                          else
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AppButton(
                                  text: 'Close',
                                  onPressed: () => Navigator.pop(context),
                                  style: AppButtonStyle.outlined,
                                  textColor: Colors.white,
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
