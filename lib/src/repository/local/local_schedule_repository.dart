import 'package:flutter_completion_test/src/service/local/daos/schedule_dao.dart';
import 'package:flutter_completion_test/src/service/local/database.dart';

class LocalScheduleRepository {
  final SchedulesDao schedulesDao;

  LocalScheduleRepository(AppDatabase appDatabase)
      : schedulesDao = appDatabase.schedulesDao;

  ///schedule_daoのメソッドを呼び出す
  Future<List<Schedule>> getAllSchedules() {
    return schedulesDao.getAllSchedules();
  }

  Future eventLoad() async {
    final scheduleList = await schedulesDao.getAllSchedules();
    final scheduleMap =
        Map.fromIterables(scheduleList.map((e) => e.start), scheduleList);
    return scheduleMap;
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
