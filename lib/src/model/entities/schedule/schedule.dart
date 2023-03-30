import 'package:flutter/material.dart';

@immutable
class Schedule {
  const Schedule(
      {required this.id,
      required this.title,
      required this.isAllDay,
      required this.start,
      required this.end,
      required this.comment});

  final String id;
  final String title;
  final bool isAllDay;
  final DateTime start;
  final DateTime end;
  final String comment;
}
