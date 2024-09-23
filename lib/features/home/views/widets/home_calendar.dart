import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/views/day_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCalendar extends StatefulWidget {
  const HomeCalendar({super.key});

  @override
  State<HomeCalendar> createState() => _HomeCalendarState();
}

class _HomeCalendarState extends State<HomeCalendar> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime firstDay = DateTime(2023, 1, 1);
    DateTime lastDay = DateTime(today.year, today.month + 1, 0);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: const Color(
          ThemeColors.white,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(
              ThemeColors.grey_200,
            ).withOpacity(0.5),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: TableCalendar(
        onDaySelected: (selectedDay, focusedDay) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DayScreen(
                  selectedDay: selectedDay,
                ),
              ));
        },
        focusedDay: today,
        firstDay: firstDay,
        lastDay: lastDay,
        rowHeight: 68,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(
                  ThemeColors.mintBlue,
                ),
              ),
            ),
          ),
          rightChevronIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(
                  ThemeColors.mintBlue,
                ),
              ),
            ),
          ),
          titleTextStyle: const TextStyle(
            color: Color(
              ThemeColors.grey_900,
            ),
            fontWeight: FontWeight.w300,
          ),
          titleTextFormatter: (date, locale) {
            return DateFormat('yyyy.M', locale).format(date);
          },
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            if (day.weekday == DateTime.sunday) {
              return Center(
                child: Text(
                  "${day.day}",
                  style: const TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
              );
            } else if (day.weekday == DateTime.saturday) {
              return Center(
                child: Text(
                  "${day.day}",
                  style: const TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              );
            }
            return null;
          },
          dowBuilder: (context, day) {
            if (day.weekday == DateTime.sunday) {
              final text = DateFormat.E().format(day).toUpperCase();
              return Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.redAccent,
                  ),
                ),
              );
            } else if (day.weekday == DateTime.saturday) {
              final text = DateFormat.E().format(day).toUpperCase();
              return Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blueAccent,
                  ),
                ),
              );
            }
            return Center(
              child: Text(
                DateFormat.E().format(day).toUpperCase(),
                style: const TextStyle(
                  color: Color(
                    ThemeColors.grey_800,
                  ),
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          },
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: const TextStyle(
            color: Color(
              ThemeColors.grey_800,
            ),
            fontWeight: FontWeight.w300,
          ),
          cellMargin: const EdgeInsets.all(4),
          todayTextStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            color: Color(
              ThemeColors.grey_800,
            ),
          ),
          todayDecoration: BoxDecoration(
            border: Border.all(
              color: const Color(
                ThemeColors.mintGreen,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
