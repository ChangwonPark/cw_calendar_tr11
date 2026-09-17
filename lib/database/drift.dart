

import 'package:drift/drift.dart'; //
import 'package:drift_flutter/drift_flutter.dart';//
import '../Model/schedule.dart'; //

part 'drift.g.dart';


@DriftDatabase(
    tables: [ScheduleTable]
)

class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'db'));

  Future<List<ScheduleTableData>> getSchedules()=>select(scheduleTable).get();

  Future<int> createSchedule(ScheduleTableCompanion data)=>into(scheduleTable).insert(data);

  @override
  int get schemaVersion => 1;
}  

// import 'dart:io';
// import 'dart:ui';
// import 'package:drift/native.dart';
// import 'package:path/path.dart' as p;
// import 'package:sqlite3/sqlite3.dart';
// import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
//  import 'package:path_provider/path_provider.dart';

//AppDatabase() : super(_openConnection());

// LazyDatabase _openConnection() {
//   return LazyDatabase(
//           () async {
//         final dbFolder = await getApplicationDocumentsDirectory();
//
//         /// 윈도에서는  C:\\Users\fluter  이런식
//         /// 맥이나 리눅스에서는 /Users/flutter + /name/codefactory 이런것을 합치면
//         /// 이렇게 됨   /Users/flutter/name/codefactory
//
//         final file = File(p.join(dbFolder.path, 'db.sqlite'));
//         /// 이것은 /Users/codefactory/calendar_scheduler/db.sqlite
//
//         /// 한가지 예외 처리해야되는데
//         if(Platform.isAndroid) {
//           await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
//         }
//
//         final cachebase=await getTemporaryDirectory();
//
//         sqlite3.tempDirectory=cachebase.path;
//
//         return NativeDatabase.createInBackground(file);
//       }
//   );
// }