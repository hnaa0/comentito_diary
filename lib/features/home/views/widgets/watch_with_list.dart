import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/models/watch_with_type.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WatchWithList extends StatelessWidget {
  const WatchWithList({
    super.key,
    required this.onWithTap,
    required this.selectedIdx,
  });

  final Function onWithTap;
  final int selectedIdx;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final watchWith = WatchWithType.values[index];
        return GestureDetector(
          onTap: () => onWithTap(
            index: index,
            watchWith: watchWith,
          ),
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 100,
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            height: 36,
            constraints: const BoxConstraints(
              minWidth: 50,
            ),
            decoration: BoxDecoration(
              color: index == selectedIdx
                  ? const Color(
                      ThemeColors.green,
                    )
                  : null,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              watchWith.korean,
              style: TextStyle(
                color: index == selectedIdx
                    ? const Color(ThemeColors.white)
                    : const Color(ThemeColors.black),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Gap(4),
      itemCount: WatchWithType.values.length,
    );
  }
}
