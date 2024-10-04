import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/home/models/comentito_model.dart';
import 'package:comentito_diary/features/home/view_models/fetch_comentito_view_model.dart';
import 'package:comentito_diary/features/home/views/day_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCalendar extends ConsumerStatefulWidget {
  const HomeCalendar({
    super.key,
    required this.focusedDay,
    required this.onDayChanged,
  });

  final DateTime focusedDay;
  final Function(DateTime) onDayChanged;

  @override
  ConsumerState<HomeCalendar> createState() => _HomeCalendarState();
}

class _HomeCalendarState extends ConsumerState<HomeCalendar> {
  final DateTime _today = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late DateTime _firstDay;
  late DateTime _lastDay;
  late ValueNotifier<List<ComentitoModel>> _selectedEvents;
  Map<DateTime, List<ComentitoModel>> _eventsList = {};

  Map<DateTime, List<ComentitoModel>> _groupingComentitos(
      List<ComentitoModel> comentitos) {
    Map<DateTime, List<ComentitoModel>> data = {};

    for (var comentito in comentitos) {
      final date = DateTime(
          comentito.date.year, comentito.date.month, comentito.date.day);

      if (data[date] == null) {
        data[date] = [comentito];
      } else {
        data[date]!.add(comentito);
      }
    }

    return data;
  }

  List<ComentitoModel> _getEventsForDay(DateTime day) {
    return _eventsList[DateTime(day.year, day.month, day.day)] ?? [];
  }

  Future<void> _fetchComentitos() async {
    final startDate = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final endDate = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);

    List<ComentitoModel> result =
        await ref.read(fetchComentitoProvider.notifier).fetchComentitos(
              startDate: startDate,
              endDate: endDate,
            );

    setState(() {
      _eventsList = _groupingComentitos(result);
    });

    _selectedEvents.value = _getEventsForDay(_focusedDay);
  }

  @override
  void initState() {
    super.initState();
    _firstDay = DateTime(2023, 1, 1);
    _lastDay = DateTime(_today.year, _today.month + 1, 0);
    _selectedEvents = ValueNotifier([]);
    _fetchComentitos();
  }

  @override
  void didUpdateWidget(covariant HomeCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusedDay != oldWidget.focusedDay) {
      setState(() {
        _focusedDay = widget.focusedDay;
      });
      _fetchComentitos();
    }
  }

  @override
  Widget build(BuildContext context) {
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
        eventLoader: _getEventsForDay,
        onPageChanged: (focusedDay) {
          // setState(() {
          //   _focusedDay = focusedDay;
          //   focusedDay = focusedDay;
          // });
          // _fetchComentitos();
          setState(() {
            widget.onDayChanged(focusedDay);
          });
          _fetchComentitos();
        },
        onDaySelected: (selectedDay, focusedDay) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DayScreen(
                selectedDay: selectedDay,
                comentitos: _eventsList[DateTime(selectedDay.year,
                        selectedDay.month, selectedDay.day)] ??
                    [],
              ),
            ),
          );
          _fetchComentitos();
        },
        focusedDay: widget.focusedDay,
        firstDay: _firstDay,
        lastDay: _lastDay,
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
          markerBuilder: (context, day, events) {
            if (events.isNotEmpty) {
              final event = events[0] as ComentitoModel;
              return Container(
                height: 68,
                width: (MediaQuery.of(context).size.width / 7),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/${event.posterPath}",
                    ),
                  ),
                ),
              );
            }
            return null;
          },
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
