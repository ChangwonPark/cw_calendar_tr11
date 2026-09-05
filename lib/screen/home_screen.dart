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
        date: DateTime.utc(2026, 8, 22),
        color: categoryColors[0],
        createdAt: DateTime.now().toUtc(),
      ),
      Schedule(
        id: 2,
        startTime: 14,
        endTime: 16,
        content: 'NodeJS 공부하기',
        date: DateTime.utc(2026, 8, 22),
        color: categoryColors[3],
        createdAt: DateTime.now().toUtc(),
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final schedule = await showModalBottomSheet<Schedule>(
            context: context,
            builder: (_) {
              return Schedulebottomsheett(
                selectedDay : selectedDay
              );
            },
          );

          if(schedule==null){
            return;
          }

          /// schedules update 하는 방법 <고난이도>
          setState(() {
            // schedules = { ...schedules, ... } → 기존 Map 전체를 펼쳐서 새 Map을 만든다
             schedules={
               ...schedules,

               //다시 정리하면, schedules= 을 update하는데,
               // ...schedules 펼치고, schedule.date:[...] 날짜에 리스트를 추가하는데,
               // schedule.date 날짜가 기존것에 있으면,
               // ...schedules[schedule.date]! 그날짜의 스케쥴을 가져오고,
               // 그뒤에 schedule 스케쥴을 추가해라.
               // 그런데, 동일날짜가 없으면,  바로 schedule 스케쥴을 추가해라

               schedule.date : [
               if(schedules.containsKey(schedule.date)) ...schedules[schedule.date]!,
               schedule,
               ]

             };
          });

          // /// schedules update 하는 방법 <쉬운거>
          // final dateExists=schedules.containsKey(schedule.date);
          //
          // final List<Schedule> existingSchedules =
          // dateExists? schedules[schedule.date]!:[];
          //
          // /// [Schedule1,Schedule2] 스케쥴1 이 있었으면, 스케쥴2 추가
          // /// [Schedule2] 스케쥴이 아예 없었으면, 스케쥴 2 만 추가
          // existingSchedules.add(schedule);
          //
          // setState(() {
          //   schedules= {
          //     ...schedules,
          //     schedule.date:existingSchedules,
          //   };
          // });

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

                ///  ListView.separated 로 스케쥴카드 사이 여유주기
                ///  .seperated도 .builder랑 itemCount, itemBuilder 필드 공유
                ///  추가로 separatorBuilder: 콜백함수 필드 정의
                ///  itemBulider 가 실행될때 마다 separatorBuilder 한번씩 실행
                ///  스케쥴 카드 사이 여유 만드는 위젯을 반환 return SizedBox(height: 16,)
                ///  schedules 0번과 1번 인덱스 사이 sperator의  index는 당연히  0번 index
                child: ListView.separated(
                  itemCount: schedules.containsKey(selectedDay)
                      ? schedules[selectedDay]!.length
                      : 0,
                  itemBuilder: (BuildContext context, int index) {
                    final selectedSchedule = schedules[selectedDay]!;

                    final schechuleModel = selectedSchedule[index];

                    return ScheduleCard(
                      startTime: schechuleModel.startTime,
                      endTime: schechuleModel.endTime,
                      content: schechuleModel.content,
                      color: Color(
                        int.parse(
                          'FF${schechuleModel.color}',
                          radix: 16
                        )
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index){
                    return SizedBox(height: 16,);
                  },
                ),




                ///  ListView.builder 사용하여 Lazy loading 하는 방법
                // 하드웨어 적게 사용하고 속도도 빨라요
                // child: ListView.builder(
                //   itemCount: schedules.containsKey(selectedDay)
                //       ? schedules[selectedDay]!.length
                //       : 0,
                //   itemBuilder: (BuildContext context, int index) {
                //     /// 선택된 날짜에 해당되는 일정 리스트로 저장
                //     /// List<Schedule> 로 가져온다
                //     final selectedSchedule = schedules[selectedDay]!;
                //
                //     final schechuleModel = selectedSchedule[index];
                //
                //     return ScheduleCard(
                //       startTime: schechuleModel.startTime,
                //       endTime: schechuleModel.endTime,
                //       content: schechuleModel.content,
                //       color: Color(
                //         int.parse(
                //           'FF${schechuleModel.color}',
                //           radix: 16
                //         )
                //       ),
                //     );
                //   },
                // ),


                /// ListView 사용하여 한방에 로딩 하기 로직
                //ListView 의 문제점은 children에 있는 위젯들을 한번에 그려내고,
                // 그리고, 그것을 메모리에 다 들고 있습니다.
                // (시간도 많이 걸리고, 메모리도 많이 차지하고 있어요)
                //
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
