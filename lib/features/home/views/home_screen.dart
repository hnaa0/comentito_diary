import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeUrl = "/home";
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ThemeColors.grey_100),
      appBar: AppBar(
        toolbarHeight: 56,
        title: const Text(
          "COMENTITO DIARY",
          style: TextStyle(
            color: Color(
              ThemeColors.white,
            ),
            fontSize: 18,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3,
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(
          ThemeColors.green,
        ),
        elevation: 0,
      ),
      body: const SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
