import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/models/comentito_model.dart';
import 'package:comentito_diary/features/home/view_models/home_calendar_view_model.dart';
import 'package:comentito_diary/features/home/views/detail_screen.dart';
import 'package:comentito_diary/features/home/views/widgets/comentito_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DayScreen extends ConsumerStatefulWidget {
  static const routeUrl = "day";
  static const routeName = "day";

  final DateTime selectedDay;
  final List<ComentitoModel> comentitos;

  const DayScreen({
    super.key,
    required this.selectedDay,
    required this.comentitos,
  });

  @override
  ConsumerState<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends ConsumerState<DayScreen> {
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
          '${DateFormat("M/d").format(widget.selectedDay)} COMENTITO',
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
            context.pop(context);
            ref
                .read(calendarProvider.notifier)
                .updateSelectedEvents(widget.comentitos);
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
        child: widget.comentitos.isEmpty
            ? const Center(
                child: Text(
                  "기록된 COMENTITO가 없어요!",
                  style: TextStyle(
                    color: Color(
                      ThemeColors.grey_500,
                    ),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final comentito = widget.comentitos[index];
                        return GestureDetector(
                            onTap: () async {
                              final result = await context.pushNamed(
                                DetailScreen.routeName,
                                extra: comentito,
                              );

                              if (result != null) {
                                setState(() {
                                  widget.comentitos.removeWhere((item) =>
                                      item.id == (result as ComentitoModel).id);
                                });
                              }
                            },
                            child: ComentitoCard(comentito: comentito));
                      },
                      separatorBuilder: (context, index) => const Gap(20),
                      itemCount: widget.comentitos.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
