import 'package:drift/drift.dart';

class CategoryTable extends Table {

  //final int id;
  IntColumn get id=>integer().autoIncrement()();


  TextColumn get color=>text()();


  //final DateTime createdAt;
  DateTimeColumn get createdAt=> dateTime().clientDefault(
          ()=>DateTime.now().toUtc()
  )();


}