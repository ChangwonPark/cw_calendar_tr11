import 'package:cw_calendar_tr11/component/calendar.dart';
import 'package:cw_calendar_tr11/component/schedule_card.dart';
import 'package:cw_calendar_tr11/component/today_banner.dart';
import 'package:cw_calendar_tr11/const/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay=DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day
      );

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              focusedDay: DateTime(2026,8,12),
              onDaySelected: onDaySelected,
              selectedDayPredicate : selectedDayPredicate,
            ),
            TodayBanner(
                selectedDay: selectedDay,
              taskCount: 0,
            ),
            Expanded(
              child: ScheduleCard(

              )
            )
          ],
        )
      ),
    );
  }
  
  void onDaySelected  (DateTime selectedDayK, DateTime focusedDayK){
      setState(() {
      this.selectedDay=selectedDayK;
      });
  }

  bool selectedDayPredicate (DateTime date ){

    if(selectedDay==null){
      return false;
    }

    return date.isAtSameMomentAs(selectedDay!);
  }

}
