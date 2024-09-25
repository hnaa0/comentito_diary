import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/views/detail_screen.dart';
import 'package:comentito_diary/features/home/views/widgets/comentito_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DayScreen extends StatelessWidget {
  static const routeUrl = "day";
  static const routeName = "day";

  final DateTime selectedDay;

  const DayScreen({
    super.key,
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        ThemeColors.white,
      ),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        toolbarHeight: 56,
        centerTitle: true,
        title: Text(
          '${DateFormat("M/d").format(selectedDay)} COMENTITO',
          style: const TextStyle(
            color: Color(
              ThemeColors.green,
            ),
            fontSize: 18,
          ),
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
        shape: const Border(
          bottom: BorderSide(
            color: Color(
              ThemeColors.mintGreen,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 32,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => context.pushNamed(DetailScreen.routeName),
              child: const ComentitoCard(),
            ),
            const Gap(20),
            const ComentitoCard(),
          ],
        ),
      ),
    );
  }
}
