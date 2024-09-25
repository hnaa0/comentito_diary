import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/models/weather_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({
    super.key,
    required this.onWeatherTap,
    required this.selectedIdx,
  });

  final Function onWeatherTap;
  final int selectedIdx;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final weather = WeatherType.values[index];
        return GestureDetector(
          onTap: () => onWeatherTap(index),
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 100,
            ),
            padding: const EdgeInsets.all(6),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == selectedIdx
                  ? const Color(
                      ThemeColors.green,
                    )
                  : null,
            ),
            child: SvgPicture.asset(
              weather.url,
              colorFilter: ColorFilter.mode(
                Color(index == selectedIdx
                    ? ThemeColors.white
                    : ThemeColors.black),
                BlendMode.srcIn,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: WeatherType.values.length,
    );
  }
}
