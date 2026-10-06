import 'package:cw_calendar_tr11/Model/category.dart';
import 'package:cw_calendar_tr11/Model/schedule.dart';
import 'package:cw_calendar_tr11/database/drift.dart';

class ScheduleWithCategory {
  final CategoryTable category;
  final ScheduleTable schedule;


  ScheduleWithCategory({
  required this.category,
  required this.schedule
  });

}