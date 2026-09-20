import 'package:cw_calendar_tr11/const/color.dart';
import 'package:cw_calendar_tr11/database/drift.dart';
import 'package:cw_calendar_tr11/screen/home_screen.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  final  database=AppDatabase();

  //214.일정 생성하기, DI 주입
  GetIt.I.registerSingleton<AppDatabase> (database);

  final resp=await database.getSchedules();
  print(resp);


  //  213.Insert & Select 테스트하기(createSchedule, getSchedules)
  // await database.createSchedule(
  //   ScheduleTableCompanion(
  //     startTime: Value(12),
  //     endTime: Value(13),
  //     content: Value('CW Flutter 프로그래밍'),
  //     date: Value(DateTime.utc(2026,8,5)),
  //     color: Value(categoryColors.first),
  //   )
  // );
  //
  // final resp = await database.getSchedules();
  // print('-----------------------------');
  // print(resp);

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans'
      ),
      home: HomeScreen(),
    )
  );
}