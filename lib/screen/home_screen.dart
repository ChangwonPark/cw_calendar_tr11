import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TableCalendar(
            focusedDay: DateTime(2026,8,12),
            firstDay: DateTime(1800),
            lastDay: DateTime(3000),
        ),
      ),
    );
  }
}
