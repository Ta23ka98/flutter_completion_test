import 'package:drift/drift.dart';
import 'package:flutter_completion_test/src/service/local/database.dart';

part 'schedule_dao.g.dart';

@DriftAccessor(tables: [Schedules])
class SchedulesDao extends DatabaseAccessor<AppDatabase>
    with _$SchedulesDaoMixin {
  SchedulesDao(AppDatabase db) : super(db);

  ///メソッドを書いていく
  //データを取得
  Future<List<Schedule>> getAllSchedules() {
    return select(schedules).get();
  }

  //データを監視
  Stream<List<Schedule>> watchAllSchedules() {
    return select(schedules).watch();
  }

  //データを追加
  Future<int> insertSchedule(SchedulesCompanion schedule) {
    return into(schedules).insert(schedule);
  }

  //データを編集
  Future updateSchedule(Schedule schedule) {
    return update(schedules).replace(schedule);
  }

  //データを削除
  Future deleteScheduleById(int id) {
    return (delete(schedules)..where((t) => t.id.equals(id))).go();
  }
}
