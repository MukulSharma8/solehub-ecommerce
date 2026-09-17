import 'package:flutter/material.dart';
import 'package:solehub/core/constants/app_colors.dart';
import 'package:solehub/screens/auth/login_screen.dart';
import 'package:solehub/screens/auth/register_screen.dart';
import 'package:solehub/screens/home/home_screen.dart';
import 'package:solehub/core/routes/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final PageController pageController = PageController();

  Widget pageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 34 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == index ? const Color(0xFF5B9EE1) : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }

  @override
  build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              pageOne(
                onNext: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              pageTwo(
                onNext: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              pageThree(
                onNext: () { Navigator.pushReplacementNamed(context, '/register');}
              ),
            ],
          ),
          Positioned(bottom: 90, left: 20, right: 0, child: pageIndicator()),
        ],
      ),
    );
  }
}

Widget pageOne({required VoidCallback onNext}) {
  return Expanded(
    child: Stack(
        children: [
          Positioned(
            top: 223,
            left: 35,
            width: 335,
            child: Image.asset(
              'assets/images/icons/NIKE.png',
              height: 116,
              width: 335,
            ),
          ),
          Positioned(
              top: 146,
              left: 47,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle
                ),
              )),
          Positioned(
              top: 444,
              left: 20,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle
                ),
              )),
          Positioned(
              top: 392,
              left: 342,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 133),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 375,
                  height: 321,
                  child: Image.asset(
                    'assets/images/preview/Sketches_prev.png',
                    width: 324,
                    height: 181,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 75),
                Text(
                  'Start Journey \nWith Nike',
                  style: TextStyle(
                    fontFamily: 'Airbnb Cereal',
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                    color: AppColors.text,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Smart, Gorgeous & Fashionable Collection',
                  style: TextStyle(
                    fontFamily: 'Airbnb Cereal',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: AppColors.subText,
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Spacer(),
                    ElevatedButton(
                      onPressed: onNext,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 32,
                        ),
                        backgroundColor: AppColors.primary,
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
    ),
  );
}

Widget pageTwo({required VoidCallback onNext}) {
  return Scaffold(
    body: Stack(
      children: [
        Positioned(
          top: 223,
          left: 35,
          width: 335,
          child: Image.asset(
            'assets/images/icons/NIKE.png',
            height: 116,
            width: 335,
          ),
        ),
        Positioned(
            top: 146,
            left: 47,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle
              ),
            )),
        Positioned(
            top: 444,
            left: 20,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle
              ),
            )),
        Positioned(
            top: 444,
            left: 342,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 133),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 375,
                height: 321,
                child: Image.asset(
                  'assets/images/preview/Ellipse.png',
                  width: 324,
                  height: 181,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 75),
              Text(
                'Follow Latest \nStyle Shoes',
                style: TextStyle(
                  fontFamily: 'Airbnb Cereal',
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                  color: AppColors.text,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'There Are Many Beautiful And Attractive Plants To Your Room ',
                style: TextStyle(
                  fontFamily: 'Airbnb Cereal',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: AppColors.subText,
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: onNext,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      backgroundColor: Color(0XFF5B9EE1),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 307,
          left: 208,
          child: Image.asset(
            'assets/images/preview/Ellips_mini.png',
            height: 165,
            width: 171,
          ),
        ),
      ],
    ),
  );
}

Widget pageThree({required VoidCallback onNext}){
  return Scaffold(
    body: Stack(
      children: [
        Positioned(
          top: 223,
          left: 35,
          width: 335,
          child: Image.asset(
            'assets/images/icons/NIKE.png',
            height: 116,
            width: 335,
          ),
        ),
        Positioned(
          top: 146,
            left: 47,
            child: Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle
          ),
        )),
        Positioned(
            top: 444,
            left: 20,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle
              ),
            )),
        Positioned(
            top: 392,
            left: 342,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 133),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 375,
                height: 321,
                child: Image.asset(
                  'assets/images/preview/Spring_prev_ui 1.png',
                  width: 324,
                  height: 181,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 75),
              Text(
                'Summer Shoes \nNike 2026',
                style: TextStyle(
                  fontFamily: 'Airbnb Cereal',
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                  color: AppColors.text,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Amet Minim Lit Nodeseru Saku \nNandu sit Alique Dolor',
                style: TextStyle(
                  fontFamily: 'Airbnb Cereal',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: AppColors.subText,
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: onNext,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
