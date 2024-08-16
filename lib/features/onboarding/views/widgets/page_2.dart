import 'package:animated_emoji/animated_emoji.dart';
import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:customizable_text/customizable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: currentPage == 1 ? 1 : 0,
      duration: const Duration(
        milliseconds: 500,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(60),
          const AnimatedEmoji(
            AnimatedEmojis.unamused,
            size: 160,
          ),
          const Gap(40),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 260,
            ),
            child: const Text(
              textAlign: TextAlign.center,
              "리뷰? 길게 남겨야 하잖아 귀찮고 부담스러워 :(",
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
                  "길게 남겨야 한단 생각에 벌써 지친다구요?",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.grey_900,
                    ),
                    fontSize: 16,
                  ),
                ),
                Gap(20),
                Text(
                  "걱정마세요!",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.grey_900,
                    ),
                    // height: 1.5,
                    fontSize: 16,
                  ),
                ),
                CustomizableText(
                  "COMENTITO DIARY는 오직 50글자만 허용합니다.",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.grey_900,
                    ),
                    fontSize: 16,
                  ),
                  customizes: [
                    CustomText(
                      "COMENTITO DIARY",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(ThemeColors.green),
                      ),
                    ),
                    CustomText(
                      "50글자만",
                      style: TextStyle(
                        color: Color(ThemeColors.green),
                      ),
                    ),
                  ],
                ),
                Text(
                  "부담없이 짧고 간결한 리뷰를 남겨보세요.",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.grey_900,
                    ),
                    fontSize: 16,
                  ),
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
