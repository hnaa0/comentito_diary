import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/models/comentito_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ComentitoCard extends StatelessWidget {
  const ComentitoCard({super.key, required this.comentito});

  final ComentitoModel comentito;

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
                "https://image.tmdb.org/t/p/w500/${comentito.posterPath}",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comentito.title,
                      style: const TextStyle(
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
                          comentito.weather.url,
                          width: 28,
                          colorFilter: const ColorFilter.mode(
                            Color(ThemeColors.grey_700),
                            BlendMode.srcIn,
                          ),
                        ),
                        const Gap(10),
                        SvgPicture.asset(
                          comentito.watchWith.url,
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
