import 'package:drift/drift.dart' hide Column;
import 'package:flutter_completion_test/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_completion_test/src/service/local/app_database.dart';

class AddSchedulePage extends ConsumerWidget {
  AddSchedulePage({Key? key}) : super(key: key);

  bool isAllDay = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  void _showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  DateTime today = DateTime.now();
  late DateTime start =
      DateTime(today.year, today.month, today.day, today.hour);
  late DateTime end =
      DateTime(today.year, today.month, today.day, today.hour + 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localRepo = ref.read(localRepoProvider);
    final scheduleRepo = localRepo.scheduleRepo;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        title: const Text("予定の追加"),
        actions: [
          ElevatedButton(
            child: Text('保存'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white70)),
            // style: ElevatedButton.styleFrom(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            // ),
            onPressed: () async {
              String titleValue = titleController.text;
              String commentValue = commentController.text;
              SchedulesCompanion newSchedule = SchedulesCompanion(
                title: Value(titleValue),
                isAllDay: Value(isAllDay),
                start: Value(start),
                end: Value(end),
                comment: Value(commentValue),
              );
              await scheduleRepo.insertSchedule(newSchedule);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 60,
            width: double.infinity,
            child: Card(
              elevation: 0,
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: InputBorder.none,
                    hintText: "タイトルを入力してください"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: Colors.white,
            height: 200,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListTile(
                    leading: const Text('終日'),
                    trailing: Switch(
                        value: isAllDay,
                        onChanged: (bool? value) {
                          if (value != null) {
                            // setState(() {
                            //   isAllDay = value;
                            // });
                          }
                        }),
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 50,
                  child: ListTile(
                    leading: const Text('開始'),
                    trailing: CupertinoButton(
                      child: Text(
                        '${start.year}-${start.month}-${start.day} ${start.hour}:${start.minute}',
                        style: const TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: start,
                              mode: CupertinoDatePickerMode.time,
                              minuteInterval: 15,
                              use24hFormat: true,
                              onDateTimeChanged: (DateTime newDate) {
                                // setState(() => start = newDate);
                              },
                            ),
                            context);
                      },
                    ),
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 50,
                  child: ListTile(
                    leading: const Text('終了'),
                    trailing: CupertinoButton(
                      child: Text(
                        '${end.year}-${end.month}-${end.day} ${end.hour}:${end.minute}',
                        style: const TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: end,
                              mode: CupertinoDatePickerMode.time,
                              minuteInterval: 15,
                              use24hFormat: true,
                              onDateTimeChanged: (DateTime newDate) {
                                // setState(() => end = newDate);
                              },
                            ),
                            context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            // ListView.separated(
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (BuildContext context, int index) {
            //     return listItems[index];
            //   },
            //   separatorBuilder: (BuildContext context, int index) {
            //     return const Divider();
            //   },
            //   itemCount: 3,
            // ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 140,
            width: double.infinity,
            child: Card(
              elevation: 0,
              child: TextField(
                controller: commentController,
                maxLines: 5,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: InputBorder.none,
                    hintText: "コメントを入力してください"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
