import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/authentication/repos/auth_repository.dart';
import 'package:comentito_diary/features/home/views/home_screen.dart';
import 'package:comentito_diary/features/onboarding/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/loading";
  static const routeName = "loading";

  const LoadingScreen({super.key});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ))
    ..repeat(reverse: true);

  late final Animation<double> _opacity =
      Tween(begin: 0.5, end: 1.0).animate(_animationController);

  late final Animation<double> _scale =
      Tween(begin: 0.95, end: 1.0).animate(_animationController);

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;

      if (isLoggedIn) {
        context.go(HomeScreen.routeUrl);
      } else {
        context.go(OnboardingScreen.routeUrl);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ThemeColors.green),
      body: SafeArea(
        child: Center(
          child: ScaleTransition(
            scale: _scale,
            child: FadeTransition(
              opacity: _opacity,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "COMENTITO",
                    style: TextStyle(
                      color: Color(ThemeColors.white),
                      fontSize: 36,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    "DIARY",
                    style: TextStyle(
                      color: Color(ThemeColors.white),
                      fontSize: 36,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
