import 'package:animated_emoji/animated_emoji.dart';
import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:customizable_text/customizable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: currentPage == 3 ? 1 : 0,
      duration: const Duration(
        milliseconds: 500,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(60),
          const AnimatedEmoji(
            AnimatedEmojis.popcorn,
            size: 160,
          ),
          const Gap(40),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 260,
            ),
            child: const Text(
              textAlign: TextAlign.center,
              "누구랑 같이 봤었지?",
              style: TextStyle(
                color: Color(ThemeColors.grey_400),
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Gap(60),
          Container(
            constraints: const BoxConstraints(maxWidth: 320),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomizableText(
                  "함께 본 사람들을 떠올리며 영화의 추억을 더 특별하게 간직할 수 있어요.",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.grey_900,
                    ),
                    fontSize: 16,
                  ),
                  customizes: [
                    CustomText(
                      "함께 본 사람들",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(ThemeColors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
