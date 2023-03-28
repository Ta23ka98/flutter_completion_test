import 'package:flutter_completion_test/src/service/local/app_database.dart';

import 'local_repository.dart';

class LocalRepositoryProvider {
  final AppDatabase appDatabase;

  late final LocalScheduleRepository scheduleRepo;

  LocalRepositoryProvider(this.appDatabase) {
    scheduleRepo = LocalScheduleRepository(appDatabase);
  }
}
