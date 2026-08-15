import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../const/color.dart';

class Calendar extends StatelessWidget {
  final DateTime focusedDay;
  final OnDaySelected onDaySelected;
  final bool Function(DateTime day) selectedDayPredicate;

  const Calendar({
    super.key,
    required this.focusedDay,
    required this.onDaySelected,
    required this.selectedDayPredicate
  });

  @override
  Widget build(BuildContext context) {

    final defaultBoxDecoration=BoxDecoration(
        border: Border.all(
          color: Colors.grey[300]!,
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(8.0)
    );

    final  defaultTextStyle=TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    );


    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      onDaySelected: onDaySelected,
      selectedDayPredicate: selectedDayPredicate,

      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),

      calendarStyle: CalendarStyle(
        isTodayHighlighted:true,
        defaultDecoration: defaultBoxDecoration,
        weekendDecoration: defaultBoxDecoration,
        todayDecoration: defaultBoxDecoration.copyWith(color: primaryColor),
        selectedDecoration: defaultBoxDecoration.copyWith(
            border: Border.all(
              color: primaryColor,
              width: 3.0,
            )
        ),
        outsideDecoration: defaultBoxDecoration,
        disabledDecoration: defaultBoxDecoration,
        holidayDecoration: defaultBoxDecoration,
        withinRangeDecoration: defaultBoxDecoration,
        rangeStartDecoration: defaultBoxDecoration,
        rangeEndDecoration: defaultBoxDecoration,
        markerDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey[600],
        ),

        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(
          color: primaryColor,
        ),
      ),

      // calendarStyle: CalendarStyle(),
    );
  }
}
