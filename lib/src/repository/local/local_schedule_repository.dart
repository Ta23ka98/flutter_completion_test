import 'package:flutter_completion_test/src/service/local/daos/schedule_dao.dart';
import 'package:flutter_completion_test/src/service/local/database.dart';

class LocalScheduleRepository {
  final SchedulesDao schedulesDao;

  LocalScheduleRepository(AppDatabase appDatabase)
      : schedulesDao = appDatabase.schedulesDao;

  //メソッドを書いていく
}
