import 'package:cw_calendar_tr11/component/calendar.dart';
import 'package:cw_calendar_tr11/component/custom_text_field.dart';
import 'package:cw_calendar_tr11/component/scheduleBottomSheett.dart';
import 'package:cw_calendar_tr11/component/schedule_card.dart';
import 'package:cw_calendar_tr11/component/today_banner.dart';
import 'package:cw_calendar_tr11/const/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Model/schedule.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  Map<DateTime, List<Schedule>> schedules = {
    DateTime.utc(2026, 8, 22): [
      Schedule(
      id: 1,
      startTime: 11,
      endTime: 12,
      content: '플러터 공부하기',
      date: DateTime.utc(2026,8,22),
      color: categoryColors[0],
      createdAt: DateTime.now().toUtc(),
    ),
      Schedule(
        id: 2,
        startTime: 14,
        endTime: 16,
        content: 'NodeJS 공부하기',
        date: DateTime.utc(2026,8,22),
        color: categoryColors[3],
        createdAt: DateTime.now().toUtc(),
      ),
   ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return Schedulebottomsheett();
            },
          );
        },
        backgroundColor: primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              focusedDay: DateTime(2026, 8, 12),
              onDaySelected: onDaySelected,
              selectedDayPredicate: selectedDayPredicate,
            ),
            TodayBanner(selectedDay: selectedDay, taskCount: 0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ListView.builder(
                  itemCount: ,
                    itemBuilder: itemBuilder
                ),


                // child: ListView(
                //   children: schedules.containsKey(selectedDay)
                //       ? schedules[selectedDay]!.map(
                //       (e)=> ScheduleCard(
                //         startTime: e.startTime,
                //         endTime: e.endTime,
                //         content: e.content,
                //         color: Color(
                //           int.parse(
                //             'FF${e.color}',
                //             radix: 16,
                //           )
                //         ),
                //       )
                //   ).toList()
                //       : []
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDayK, DateTime focusedDayK) {
    setState(() {
      this.selectedDay = selectedDayK;
    });
  }

  bool selectedDayPredicate(DateTime date) {
    if (selectedDay == null) {
      return false;
    }

    return date.isAtSameMomentAs(selectedDay!);
  }
}
