import 'package:animated_emoji/animated_emoji.dart';
import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:customizable_text/customizable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: currentPage == 2 ? 1 : 0,
      duration: const Duration(
        milliseconds: 500,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(60),
          const AnimatedEmoji(
            AnimatedEmojis.rainbow,
            size: 160,
          ),
          const Gap(40),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 260,
            ),
            child: const Text(
              textAlign: TextAlign.center,
              "그 날 날씨가 어땠더라?",
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
                Text(
                  "날씨는 기억을 회상하는 데 중요한 역할을 합니다.",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.grey_900,
                    ),
                    fontSize: 16,
                  ),
                ),
                Gap(20),
                CustomizableText(
                  "날씨 기록을 통해 그 날의 기억을 더욱 생생하게 떠올려 보세요.",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.grey_900,
                    ),
                    fontSize: 16,
                  ),
                  customizes: [
                    CustomText(
                      "날씨 기록",
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
