import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:comentito_diary/features/home/models/comentito_model.dart';

class CalendarState {
  final DateTime focusedDay;
  final List<ComentitoModel> selectedEvents;

  CalendarState({
    required this.focusedDay,
    required this.selectedEvents,
  });
}

class CalendarNotifier extends StateNotifier<CalendarState> {
  CalendarNotifier()
      : super(CalendarState(focusedDay: DateTime.now(), selectedEvents: []));

  void updateFocusedDay(DateTime day) {
    state =
        CalendarState(focusedDay: day, selectedEvents: state.selectedEvents);
  }

  void updateSelectedEvents(List<ComentitoModel> events) {
    state = CalendarState(focusedDay: state.focusedDay, selectedEvents: events);
  }
}

final calendarProvider =
    StateNotifierProvider<CalendarNotifier, CalendarState>((ref) {
  return CalendarNotifier();
});
