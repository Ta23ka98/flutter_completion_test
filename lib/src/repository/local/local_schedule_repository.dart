import 'package:flutter_completion_test/src/service/local/daos/schedule_dao.dart';
import 'package:flutter_completion_test/src/service/local/database.dart';

class LocalScheduleRepository {
  final SchedulesDao schedulesDao;

  LocalScheduleRepository(AppDatabase appDatabase)
      : schedulesDao = appDatabase.schedulesDao;

  //schedule_daoのメソッドを呼び出す
  Future<List<Schedule>> getAllSchedules() {
    return schedulesDao.getAllSchedules();
  }

  Future<Map<DateTime, List<Schedule>>> eventLoad() async {
    final scheduleList = await schedulesDao.getAllSchedules();

    //空のMapを用意する
    final map = <DateTime, List<Schedule>>{};

    //scheduleListの各要素に対してfor文を実行してmapに代入する
    for (var schedule in scheduleList) {
      //Datetime.utc()でフォーマットし直さないと、eventLoaderで読み込まれないので注意
      final createdAt = DateTime.utc(
          schedule.start.year, schedule.start.month, schedule.start.day);

      //特定の日付についてScheduleを代入するためのif文
      //この時、代入先がnullの場合は配列をそのまま代入する
      if (map[createdAt] == null) {
        map[createdAt] = [schedule];
      } else {
        //nullでない場合は.add()が使える
        map[createdAt]!.add(schedule);
      }
    }
    // debugPrint(scheduleList.toString());
    // debugPrint(map.toString());
    return map;
  }

  Stream<List<Schedule>> watchAllTodos() {
    return schedulesDao.watchAllSchedules();
  }

  Future<void> insertSchedule(SchedulesCompanion schedule) {
    return schedulesDao.insertSchedule(schedule);
  }

  Future<void> updateSchedule(Schedule schedule) {
    return schedulesDao.updateSchedule(schedule);
  }

  Future<void> deleteScheduleById(int id) {
    return schedulesDao.deleteScheduleById(id);
  }
}
