import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/views/widgets/watch_with_list.dart';
import 'package:comentito_diary/features/home/views/widgets/weather_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WriteBottomsheet extends StatefulWidget {
  const WriteBottomsheet({super.key});

  @override
  State<WriteBottomsheet> createState() => _WriteBottomsheetState();
}

class _WriteBottomsheetState extends State<WriteBottomsheet> {
  int _seletedWeatherIdx = 0;
  int _seletedWithIdx = 0;

  void _onWeatherTap(int index) {
    setState(() {
      _seletedWeatherIdx = index;
    });
  }

  void _onWithTap(int index) {
    setState(() {
      _seletedWithIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "COMENTITO",
                style: TextStyle(
                  color: Color(
                    ThemeColors.green,
                  ),
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Gap(30),
              Row(
                children: [
                  const Text(
                    "영화",
                    style: TextStyle(
                      color: Color(
                        ThemeColors.grey_900,
                      ),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Gap(14),
                  Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(
                        ThemeColors.white,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(
                            ThemeColors.grey_200,
                          ),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  SvgPicture.asset(
                    "assets/icons/x.svg",
                    width: 18,
                  ),
                ],
              ),
              const Gap(24),
              Row(
                children: [
                  const Text(
                    "날짜",
                    style: TextStyle(
                      color: Color(
                        ThemeColors.grey_900,
                      ),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Gap(14),
                  Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(
                        ThemeColors.white,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(
                            ThemeColors.grey_200,
                          ),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  SvgPicture.asset(
                    "assets/icons/calendar-check.svg",
                    width: 18,
                  ),
                ],
              ),
              const Gap(24),
              Row(
                children: [
                  const Text(
                    "날씨",
                    style: TextStyle(
                      color: Color(
                        ThemeColors.grey_900,
                      ),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Gap(14),
                  Expanded(
                    child: SizedBox(
                      height: 36,
                      child: WeatherList(
                        onWeatherTap: _onWeatherTap,
                        selectedIdx: _seletedWeatherIdx,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(24),
              Row(
                children: [
                  const Text(
                    "누구랑",
                    style: TextStyle(
                      color: Color(
                        ThemeColors.grey_900,
                      ),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Gap(14),
                  Expanded(
                    child: SizedBox(
                      height: 34,
                      child: WatchWithList(
                        onWithTap: _onWithTap,
                        selectedIdx: _seletedWithIdx,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "COMENTITO",
                    style: TextStyle(
                      color: Color(
                        ThemeColors.grey_900,
                      ),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Gap(8),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          cursorColor: const Color(
                            ThemeColors.green,
                          ),
                          maxLines: 5,
                          maxLength: 50,
                          decoration: InputDecoration(
                            counterStyle: const TextStyle(
                              color: Color(
                                ThemeColors.grey_500,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(
                                  ThemeColors.mintBlue,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(
                                  ThemeColors.mintBlue,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: const Color(
                              ThemeColors.white,
                            ),
                          ),
                        ),
                        const Gap(16),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: const Color(
                                ThemeColors.green,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "저장",
                              style: TextStyle(
                                color: Color(
                                  ThemeColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(80),
            ],
          ),
        ),
      ),
    );
  }
}
