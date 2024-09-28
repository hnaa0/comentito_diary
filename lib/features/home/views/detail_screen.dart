import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/models/comentito_model.dart';
import 'package:comentito_diary/features/home/views/widgets/delete_bottomsheet.dart';
import 'package:comentito_diary/features/home/views/widgets/movie_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  static const routeUrl = "detail";
  static const routeName = "detail";

  const DetailScreen({super.key, required this.comentito});

  final ComentitoModel comentito;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          ThemeColors.mintCream,
        ),
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              "assets/icons/angle-left.svg",
            ),
          ),
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              showModalBottomSheet(
                backgroundColor: const Color(
                  ThemeColors.white,
                ),
                showDragHandle: true,
                elevation: 0,
                context: context,
                builder: (context) {
                  return const DeleteBottomsheet();
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                "assets/icons/trash-xmark.svg",
              ),
            ),
          ),
        ],
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color(
                ThemeColors.mintCream,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: const BoxDecoration(
                color: Color(
                  ThemeColors.white,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(
                      ThemeColors.grey_200,
                    ),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(60),
                      Row(
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(
                                ThemeColors.mintBlue,
                              ),
                            ),
                          ),
                          const Gap(4),
                          const Text(
                            "날씨",
                            style: TextStyle(
                              color: Color(
                                ThemeColors.grey_700,
                              ),
                            ),
                          ),
                          const Gap(12),
                          SvgPicture.asset(
                            comentito.weather.url,
                            height: 25,
                            // width: 16,
                          ),
                          const Spacer(),
                          Container(
                            width: 14,
                            height: 14,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(
                                ThemeColors.mintBlue,
                              ),
                            ),
                          ),
                          const Gap(4),
                          const Text(
                            "누구와",
                            style: TextStyle(
                              color: Color(
                                ThemeColors.grey_700,
                              ),
                            ),
                          ),
                          const Gap(12),
                          Text(
                            comentito.watchWith.korean,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(
                                ThemeColors.grey_900,
                              ),
                            ),
                          ),
                          const Gap(4),
                          SvgPicture.asset(
                            comentito.watchWith.url,
                            height: 25,
                            // width: 16,
                          ),
                        ],
                      ),
                      const Gap(40),
                      const Text(
                        "COMENTITO",
                        style: TextStyle(
                          color: Color(
                            ThemeColors.green,
                          ),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        comentito.text,
                        style: const TextStyle(
                          color: Color(
                            ThemeColors.grey_900,
                          ),
                          fontSize: 16,
                        ),
                      ),
                      const Gap(60),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06,
            left: 0,
            right: 0,
            child: const MovieInfo(),
          ),
        ],
      ),
    );
  }
}
