import 'package:cw_calendar_tr11/const/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {


  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TableCalendar(
            focusedDay: DateTime(2026,8,12),
            firstDay: DateTime(1800),
            lastDay: DateTime(3000),
          onDaySelected: (DateTime selectedDayK, DateTime focusedDay){
              print(selectedDay);
              print(focusedDay);

              setState(() {
                this.selectedDay=selectedDayK;
              });
          },
          selectedDayPredicate: (DateTime date){
              if(selectedDay==null){
                return false;
              }

              return date.isAtSameMomentAs(selectedDay!);
          },

          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            )
          ),

          calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            defaultDecoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 3.0),
            )
          ),
        ),
      ),
    );
  }
}
