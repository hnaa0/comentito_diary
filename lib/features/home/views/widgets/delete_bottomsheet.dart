import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DeleteBottomsheet extends StatelessWidget {
  const DeleteBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/icons/trash-xmark.svg",
            width: 36,
          ),
          const Gap(20),
          const Text(
            "이 기록을 삭제할까요?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(8),
          const Text(
            "삭제한 기록은 복구할 수 없습니다.",
            style: TextStyle(
              color: Color(
                ThemeColors.grey_700,
              ),
            ),
          ),
          const Gap(36),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(
                ThemeColors.green,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "네 삭제할게요",
              style: TextStyle(
                color: Color(
                  ThemeColors.white,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "아니요",
              style: TextStyle(
                color: Color(
                  ThemeColors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
