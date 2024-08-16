import 'package:animated_emoji/animated_emoji.dart';
import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:customizable_text/customizable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: currentPage == 0 ? 1 : 0,
      duration: const Duration(
        milliseconds: 500,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(60),
          const AnimatedEmoji(
            AnimatedEmojis.thinkingFace,
            size: 160,
          ),
          const Gap(40),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 260,
            ),
            child: const Text(
              "COMENTITO?",
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
              children: [
                CustomizableText(
                  "의견, 댓글을 뜻하는 영단어 comment와 스페인어의 축소사 -ito를 접목시킨 합성어로 작은 댓글 혹은 짧은 의견을 의미합니다.",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.grey_900,
                    ),
                    fontSize: 16,
                  ),
                  customStyle: TextStyle(
                    color: Color(ThemeColors.green),
                  ),
                  customizes: [
                    CustomText("comment"),
                    CustomText("-ito"),
                    CustomText("작은 댓글 혹은 짧은 의견"),
                  ],
                ),
                Gap(20),
                CustomizableText(
                  "COMENTITO DIARY와 함께 날씨, 함께한 사람, 영화 리뷰 등을 기록하여 특별한 추억을 생생하게 간직하세요.",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.grey_900,
                    ),
                    fontSize: 16,
                  ),
                  customStyle: TextStyle(
                    color: Color(ThemeColors.green),
                    fontWeight: FontWeight.w500,
                  ),
                  customizes: [
                    CustomText("COMENTITO DIARY"),
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
