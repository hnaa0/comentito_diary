import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "비긴 어게인",
            style: TextStyle(
              color: Color(
                ThemeColors.green,
              ),
              fontSize: 26,
            ),
          ),
          const Gap(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.48,
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20240820_178%2F1724133122047df9TH_JPEG%2Fmovie_image.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(
                            ThemeColors.grey_600,
                          ),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "감독",
                          style: TextStyle(
                            color: Color(
                              ThemeColors.grey_500,
                            ),
                          ),
                        ),
                        Gap(10),
                        Expanded(
                          child: Text(
                            "존 카니",
                            style: TextStyle(
                              color: Color(
                                ThemeColors.grey_800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "장르",
                          style: TextStyle(
                            color: Color(
                              ThemeColors.grey_500,
                            ),
                          ),
                        ),
                        Gap(10),
                        Expanded(
                          child: Text(
                            "드라마, 멜로/로맨스, 코미디",
                            style: TextStyle(
                              color: Color(
                                ThemeColors.grey_800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "배우",
                          style: TextStyle(
                            color: Color(
                              ThemeColors.grey_500,
                            ),
                          ),
                        ),
                        Gap(10),
                        Expanded(
                          child: Text(
                            "키이라 나이틀리, 마크 러팔로, 애덤 리바인",
                            style: TextStyle(
                              color: Color(
                                ThemeColors.grey_800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
