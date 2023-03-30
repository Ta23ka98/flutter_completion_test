import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_completion_test/src/repository/local/local_repository_provider.dart';
import 'package:flutter_completion_test/src/service/local/app_database.dart';
import 'package:flutter_completion_test/src/routing/app_router.dart';
import 'package:flutter_completion_test/src/service/local/app_database.dart';
import 'package:flutter_completion_test/src/view/add_schedule_page/add_schedule_page.dart';
import 'package:flutter_completion_test/src/view/calendar_page/calendar_page.dart';
import 'package:flutter_completion_test/src/view/schedule_list_page/schedule_list_page.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final appDatabase = AppDatabase();
  return appDatabase;
});

final localRepoProvider = Provider<LocalRepositoryProvider>(
    (ref) => LocalRepositoryProvider(ref.watch(databaseProvider)));

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      home: CalendarPage(),
    );
  }
}
