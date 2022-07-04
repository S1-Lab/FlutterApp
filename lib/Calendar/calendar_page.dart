import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  var _selectedDay;
  var _focusedDay = DateTime.now();
  Map<dynamic, List> _eventsList = {};

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _selectedDay = _focusedDay;
    var now = DateTime.now();
    _eventsList = {
      DateFormat('yyyy-MM-dd').format(now.subtract(Duration(days: 2))): ['Event A1', 'Event B1'],
      DateFormat('yyyy-MM-dd').format(now): ['Event A2', 'Event B2', 'Event C1', 'Event D1'],
      DateFormat('yyyy-MM-dd').format(now.add(Duration(days: 1))): [
        'Event A3',
        'Event B3',
        'Event C2',
        'Event D2'
      ],
      DateFormat('yyyy-MM-dd').format(now.add(Duration(days: 3))):
      Set.from(['Event A4', 'Event A5', 'Event B4']).toList(),
      DateFormat('yyyy-MM-dd').format(now.add(Duration(days: 7))): [
        'Event A6',
        'Event B5',
        'Event C3'
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, List> _events = {}..addAll(_eventsList);

    List _getEventForDay(DateTime day) {
      var day2 = DateFormat('yyyy-MM-dd').format(day);
      return _events[day2] ?? [];
    }

    return
      Column(
          children: [
            TableCalendar(
              // calendarStyle: CalendarStyle(
              //   selectedDecoration: BoxDecoration(
              //     color: Colors.transparent,
              //     shape: BoxShape.circle,
              //     border: Border.all(color: Colors.green,width: 1.5)
              //   ),
              //   selectedTextStyle: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     color: Colors.grey
              //   )
              // ),
              firstDay: DateTime.now().subtract(Duration(days: 365*10 + 2)),
              lastDay: DateTime.now().add(Duration(days: 365*10 + 2)),
              focusedDay: _focusedDay,
              eventLoader: _getEventForDay,
              locale: 'ko-KR',
              daysOfWeekHeight: 30,
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },

              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                _getEventForDay(selectedDay);
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            ListView(
              shrinkWrap: true,
              children: _getEventForDay(_selectedDay!)
                  .map((event) => ListTile(
                    title: Text(event.toString()),
                  ))
                  .toList(),
            )
          ]
      );
  }
}