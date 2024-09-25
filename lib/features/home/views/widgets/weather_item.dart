import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(
          ThemeColors.green,
        ),
      ),
      child: SvgPicture.asset(
        "assets/icons/weather-cloud-showers-heavy.svg",
      ),
    );
  }
}
