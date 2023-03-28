import 'package:drift/drift.dart';
import 'package:flutter_completion_test/src/service/local/database.dart';

part 'schedule_dao.g.dart';

@DriftAccessor(tables: [Schedules])
class SchedulesDao extends DatabaseAccessor<AppDatabase>
    with _$SchedulesDaoMixin {
  SchedulesDao(AppDatabase db) : super(db);
}
