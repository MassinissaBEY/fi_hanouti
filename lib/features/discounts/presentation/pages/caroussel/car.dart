import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fi_hanouti/core/constants/app_colors.dart';
import 'package:fi_hanouti/features/discounts/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CarrouselPage extends StatefulWidget {
  const CarrouselPage({Key? key}) : super(key: key);

  @override
  State<CarrouselPage> createState() => _CarrouselPageState();
}

class _CarrouselPageState extends State<CarrouselPage> {
  int _currentIndex = 0;

  final List<String> stepTitles = [
    'Step 1',
    'Step 2',
    'Step 3',
    'Step 4',
    'Step 5',
  ];

  final List<String> stepDescriptions = [
    'Explore restaurants, pick delicious meals, and fill your cart.',
    'Tap \'Get Order\' to reveal the code and enjoy meal discounts.',
    'If you\'re not at the restaurant, tap \'Save Code\' to store it later.',
    'At the restaurant, show the QR code before paying to get the discount.',
    'You\'ll see the final amount, current discount, and future loyalty savings.',
  ];

  // Fonction pour ouvrir YouTube
  Future<void> _launchYouTube() async {
    final Uri url = Uri.parse('https://www.youtube.com/@FelHanoutDz/featured');

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication, // ← important
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLast = _currentIndex == stepTitles.length - 1;

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

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                const Center(
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),

                Center(
                  child: Text(
                    'How do I get discounts?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                CarouselSlider.builder(
                  key: ValueKey(_currentIndex),
                  itemCount: stepTitles.length,
                  itemBuilder: (context, index, realIndex) {
                    return const CarouselPage();
                  },
                  options: CarouselOptions(
                    height: size.height * 0.5,
                    enlargeCenterPage: false,
                    autoPlay: false,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    initialPage: _currentIndex,
                    onPageChanged: (index, reason) {
                      setState(() => _currentIndex = index);
                    },
                  ),
                ),

                Container(
                  height: 130,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stepTitles[_currentIndex],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.042,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Flexible(
                        child: Text(
                          stepDescriptions[_currentIndex],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.04,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(stepTitles.length, (index) {
                            return Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _currentIndex == index
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.4),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColorDark,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: _launchYouTube,
                          child: Image.asset(
                            'assets/images/youtube_logo.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        children: [
                          if (isLast)
                            AppButton(
                              text: 'Close',
                              onPressed: () => Navigator.pop(context),
                              style: AppButtonStyle.outlined,
                              textColor: Colors.white,
                              radius: 5,
                            )
                          else ...[
                            AppButton(
                              text: 'Back',
                              onPressed: () {
                                if (_currentIndex == 0) {
                                  Navigator.pop(context);
                                } else {
                                  setState(() => _currentIndex--);
                                }
                              },
                              style: AppButtonStyle.outlined,
                              textColor: Colors.white,
                              radius: 5,
                            ),
                            AppButton(
                              text: 'Next',
                              onPressed: () => setState(() => _currentIndex++),
                              style: AppButtonStyle.filled,
                              backgroundColor: Colors.white,
                              textColor: AppColors.primaryColorDark,
                              radius: 5,
                            ),
                          ],
                        ],
                      ),
                    ],
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

class CarouselPage extends StatelessWidget {
  const CarouselPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.5,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Image.asset('assets/images/pic.png', fit: BoxFit.contain),
    );
  }
}
