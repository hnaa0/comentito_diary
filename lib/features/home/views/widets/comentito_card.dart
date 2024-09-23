import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ComentitoCard extends StatelessWidget {
  const ComentitoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(
            ThemeColors.mintGreen,
          ),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(ThemeColors.grey_200),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Image.network(
                "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20240820_178%2F1724133122047df9TH_JPEG%2Fmovie_image.jpg",
                height: 175,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(
                  ThemeColors.white,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    const Text(
                      "비긴 어게인",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(
                          ThemeColors.grey_900,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/weather-cloud-showers-heavy.svg",
                          width: 28,
                          colorFilter: const ColorFilter.mode(
                            Color(ThemeColors.grey_700),
                            BlendMode.srcIn,
                          ),
                        ),
                        const Gap(10),
                        SvgPicture.asset(
                          "assets/icons/woman.svg",
                          width: 28,
                          colorFilter: const ColorFilter.mode(
                            Color(ThemeColors.grey_700),
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
