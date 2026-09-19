import 'package:cw_calendar_tr11/database/drift.dart';
import 'package:cw_calendar_tr11/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  final  database=AppDatabase();



  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans'
      ),
      home: HomeScreen(),
    )
  );
}