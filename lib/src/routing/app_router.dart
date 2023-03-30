import 'package:flutter/material.dart';
import 'package:flutter_completion_test/src/view/calendar_page/calendar_page.dart';
import 'package:flutter_completion_test/src/view/edit_schedule_page/edit_schedule_page.dart';
import 'package:flutter_completion_test/src/view/schedule_list_page/schedule_list_page.dart';
import 'package:flutter_completion_test/src/view/add_schedule_page/add_schedule_page.dart';
//import 'package:flutter_completion_test/src/view/edit_schedule_page/';

import 'app_routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.calendar:
        return _buildRoute(CalendarPage());

      case AppRoutes.scheduleList:
        return _buildRoute(const ScheduleListPage());

      case AppRoutes.addSchedule:
        return _buildRoute(AddSchedulePage());

      case AppRoutes.editSchedule:
        return _buildRoute(const EditSchedulePage());

      default:
        throw Exception('Unknown route: ${settings.name}');
    }
  }

  static Route<dynamic>? _buildRoute(
    Widget child, {
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) {
    return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => child,
        settings: settings,
        fullscreenDialog: fullscreenDialog);
  }
}
