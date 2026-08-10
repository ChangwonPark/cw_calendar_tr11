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
          onDaySelected: (DateTime selectedDay, DateTime focusedDay){
              print(selectedDay);
              print(focusedDay);
          },
          selectedDayPredicate: (DateTime time){
              return true;
          },
        ),
      ),
    );
  }
}
