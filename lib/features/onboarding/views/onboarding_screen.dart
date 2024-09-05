import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/authentication/views/sign_in_screen.dart';
import 'package:comentito_diary/features/onboarding/views/widgets/page_1.dart';
import 'package:comentito_diary/features/onboarding/views/widgets/page_2.dart';
import 'package:comentito_diary/features/onboarding/views/widgets/page_3.dart';
import 'package:comentito_diary/features/onboarding/views/widgets/page_4.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeUrl = "/on-boarding";
  static const routeName = "on-boarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChange(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  void _onStartTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "COMENTITO DIARY",
          style: TextStyle(
            color: Color(
              ThemeColors.green,
            ),
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(ThemeColors.mintCream),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) => _onPageChange(value),
                children: [
                  Page1(currentPage: _currentPage),
                  Page2(currentPage: _currentPage),
                  Page3(currentPage: _currentPage),
                  Page4(currentPage: _currentPage),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: const JumpingDotEffect(
                spacing: 18,
                dotWidth: 12,
                dotHeight: 12,
                dotColor: Color(
                  ThemeColors.grey_200,
                ),
                activeDotColor: Color(
                  ThemeColors.mintGreen,
                ),
              ),
            ),
            const Gap(12),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedOpacity(
        opacity: _currentPage == 3 ? 1 : 0,
        duration: const Duration(
          milliseconds: 200,
        ),
        child: GestureDetector(
          onTap: _currentPage == 3 ? _onStartTap : null,
          child: BottomAppBar(
            height: 60,
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(ThemeColors.green),
              ),
              child: const Text(
                "시작하기",
                style: TextStyle(
                  color: Color(
                    ThemeColors.white,
                  ),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
