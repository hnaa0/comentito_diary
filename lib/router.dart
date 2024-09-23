import 'package:comentito_diary/features/authentication/views/sign_in_screen.dart';
import 'package:comentito_diary/features/authentication/views/sign_up_screen.dart';
import 'package:comentito_diary/features/home/views/day_screen.dart';
import 'package:comentito_diary/features/home/views/home_screen.dart';
import 'package:comentito_diary/features/onboarding/views/loading_screen.dart';
import 'package:comentito_diary/features/onboarding/views/onboarding_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: LoadingScreen.routeUrl,
    routes: [
      GoRoute(
        path: LoadingScreen.routeUrl,
        name: LoadingScreen.routeName,
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: OnboardingScreen.routeUrl,
        name: OnboardingScreen.routeName,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: SignInScreen.routeUrl,
        name: SignInScreen.routeName,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: SignUpScreen.routeUrl,
        name: SignUpScreen.routeName,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: HomeScreen.routeUrl,
        name: HomeScreen.routeName,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: DayScreen.routeUrl,
            name: DayScreen.routeName,
            builder: (context, state) {
              final selectedDay = state.extra as DateTime;
              return DayScreen(selectedDay: selectedDay);
            },
          )
        ],
      ),
    ],
  );
});
