import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/view_models/home_calendar_view_model.dart';
import 'package:comentito_diary/features/home/views/widgets/end_drawer.dart';
import 'package:comentito_diary/features/home/views/widgets/home_calendar.dart';
import 'package:comentito_diary/features/home/views/widgets/write_bottomsheet.dart';
import 'package:customizable_text/customizable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends ConsumerWidget {
  static const routeUrl = "/home";
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarState = ref.watch(calendarProvider);

    return Scaffold(
      backgroundColor: const Color(
        ThemeColors.mintCream,
      ),
      appBar: AppBar(
        toolbarHeight: 56,
        title: const Text(
          "COMENTITO DIARY",
          style: TextStyle(
            color: Color(
              ThemeColors.white,
            ),
            fontSize: 18,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3,
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(
          ThemeColors.green,
        ),
        elevation: 0,
        actions: [
          Builder(
            builder: (context) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/menu-burger.svg",
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                      Color(ThemeColors.white),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    HomeCalendar(
                        focusedDay: calendarState.focusedDay,
                        onDayChanged: (day) {
                          ref
                              .read(calendarProvider.notifier)
                              .updateFocusedDay(day);
                        }),
                    const Gap(36),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 26,
                      ),
                      // child: Column(
                      //   children: [
                      //     Container(
                      //       width: MediaQuery.of(context).size.width,
                      //       padding: const EdgeInsets.symmetric(
                      //         horizontal: 12,
                      //         vertical: 14,
                      //       ),
                      //       decoration: BoxDecoration(
                      //         color: const Color(
                      //           ThemeColors.white,
                      //         ),
                      //         border: Border.all(
                      //           color: const Color(
                      //             ThemeColors.mintGreen,
                      //           ),
                      //         ),
                      //         borderRadius: BorderRadius.circular(10),
                      //         boxShadow: const [
                      //           BoxShadow(
                      //             color: Color(
                      //               ThemeColors.grey_200,
                      //             ),
                      //             blurRadius: 4,
                      //           ),
                      //         ],
                      //       ),
                      //       child: const CustomizableText(
                      //         "9월에 기록된 COMENTITO는 총 5개입니다.",
                      //         style: TextStyle(
                      //           color: Color(
                      //             ThemeColors.grey_800,
                      //           ),
                      //         ),
                      //         customStyle: TextStyle(
                      //           color: Color(ThemeColors.green),
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: 16,
                      //         ),
                      //         customizes: [
                      //           CustomText(
                      //             "5개",
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     const Gap(20),
                      //     Container(
                      //       width: MediaQuery.of(context).size.width,
                      //       padding: const EdgeInsets.symmetric(
                      //         horizontal: 12,
                      //         vertical: 14,
                      //       ),
                      //       decoration: BoxDecoration(
                      //         color: const Color(
                      //           ThemeColors.white,
                      //         ),
                      //         border: Border.all(
                      //           color: const Color(
                      //             ThemeColors.mintGreen,
                      //           ),
                      //         ),
                      //         borderRadius: BorderRadius.circular(10),
                      //         boxShadow: const [
                      //           BoxShadow(
                      //             color: Color(
                      //               ThemeColors.grey_200,
                      //             ),
                      //             blurRadius: 4,
                      //           ),
                      //         ],
                      //       ),
                      //       child: const Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             "9월에 가장 많이 관람한 장르는",
                      //             style: TextStyle(
                      //               color: Color(
                      //                 ThemeColors.grey_800,
                      //               ),
                      //             ),
                      //           ),
                      //           Row(
                      //             children: [
                      //               Text(
                      //                 "액션, SF, 코미디",
                      //                 style: TextStyle(
                      //                   color: Color(
                      //                     ThemeColors.green,
                      //                   ),
                      //                   fontWeight: FontWeight.w600,
                      //                   fontSize: 16,
                      //                 ),
                      //               ),
                      //               Text(
                      //                 "입니다.",
                      //                 style: TextStyle(
                      //                   color: Color(
                      //                     ThemeColors.grey_800,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                    const Gap(60),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 30,
              bottom: 30,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: const Color(
                      ThemeColors.mintCream,
                    ),
                    isScrollControlled: true,
                    showDragHandle: true,
                    elevation: 0,
                    context: context,
                    builder: (context) {
                      return const WriteBottomsheet();
                    },
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(
                      ThemeColors.mintBlue,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(
                          ThemeColors.grey_200,
                        ),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/add.svg",
                    colorFilter: const ColorFilter.mode(
                      Color(ThemeColors.white),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: const EndDrawer(),
    );
  }
}
