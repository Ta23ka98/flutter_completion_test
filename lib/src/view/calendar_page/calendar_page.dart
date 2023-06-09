import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_completion_test/main.dart';
import 'package:flutter_completion_test/src/service/local/app_database.dart';
import 'package:flutter_completion_test/src/view/add_schedule_page/add_schedule_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

final scheduleListProvider = StreamProvider((ref) {
  final localRepo = ref.read(localRepoProvider);
  final scheduleRepo = localRepo.scheduleRepo;
  return scheduleRepo.watchAllTodos();
});

final scheduleMapGetProvider =
    FutureProvider<Map<DateTime, List<Schedule>>>((ref) {
  final localRepo = ref.read(localRepoProvider);
  final scheduleRepo = localRepo.scheduleRepo;
  return scheduleRepo.eventLoad();
});

class CalendarPage extends ConsumerWidget {
  CalendarPage({Key? key}) : super(key: key);

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
  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);
  String? selectedItem = "2021年 08月";
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  List<DropdownMenuItem> menuItems = [];
  List<Widget> dialogs = [
    SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("2021/08/02（月）"),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              color: Colors.blue,
            )
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                Text("10:00"),
                Text("11:00"),
              ],
            ),
            Container(
              color: Colors.blue,
              height: 40,
              width: 3,
            ),
            const Text("タイトルタイトルタイトル"),
          ],
        ),
        const Divider(),
        const TextButton(
          onPressed: null,
          child: Text("あ"),
        ),
        const Divider(),
        const TextButton(
          onPressed: null,
          child: Text("あ"),
        ),
        const Divider(),
        const TextButton(
          onPressed: null,
          child: Text("あ"),
        ),
        const Divider(),
        const TextButton(
          onPressed: null,
          child: Text("あ"),
        ),
        const Divider(),
        const TextButton(
          onPressed: null,
          child: Text("あ"),
        ),
      ],
    ),
  ];
  List<String> _selectedEvents = [];
  List<dynamic> _getEventsForDay(DateTime day) {
    // Implementation example
    return sampleMap[day] ?? [];
  }

  final sampleMap = {
    DateTime.utc(2023, 3, 5): ['thirdEvent', 'fourthEvent']
  };
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleList = ref.watch(scheduleMapGetProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("カレンダー"),
      ),
      body: scheduleList.when(
        //エラー時
        error: (err, _) => Text(err.toString()),
        //読み込み時
        loading: () => const Center(child: CircularProgressIndicator()),
        //データ受け取り時
        data: (data) {
          int itemCount = data.length;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: const BorderSide(color: Colors.blue),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: const Text('今日'),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  CupertinoButton(
                    child: Row(
                      children: [
                        Text(
                          '${today.year}年 ${today.month}月',
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Icon(Icons.arrow_drop_down, color: Colors.black)
                      ],
                    ),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate:
                              DateTime.now().add(const Duration(days: 360)));
                      // _showDialog(
                      //     CupertinoDatePicker(
                      //       initialDateTime: date,
                      //       mode: CupertinoDatePickerMode.date,
                      //       use24hFormat: true,
                      //       onDateTimeChanged: (DateTime newDate) {
                      //         // setState(() => date = newDate);
                      //       },
                      //     ),
                      //     context);
                    },
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                ],
              ),
              TableCalendar(
                eventLoader: (date) {
                  ///Map<Datetime, List<~>>を返す必要がある
                  return scheduleList.when(
                      //エラー時
                      error: (err, _) => [],
                      //読み込み中
                      loading: () => [],
                      //表示可能
                      data: (data) {
                        return data[date] ?? [];
                      });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  // setState(() {
                  _selectedEvents = sampleMap[selectedDay] ?? [];

                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  // });
                },
                headerVisible: false,
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 1, 1),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return SimpleDialog(
                  contentPadding: const EdgeInsets.all(16),
                  insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("2021/08/02（月）"),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AddSchedulePage(),
                                    fullscreenDialog: true));
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.blue,
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Text("10:00"),
                            Text("11:00"),
                          ],
                        ),
                        Container(
                          color: Colors.blue,
                          height: 40,
                          width: 3,
                        ),
                        const Text("タイトルタイトルタイトル"),
                      ],
                    ),
                    const Divider(),
                    const TextButton(
                      onPressed: null,
                      child: Text("あ"),
                    ),
                    const Divider(),
                    const TextButton(
                      onPressed: null,
                      child: Text("あ"),
                    ),
                    const Divider(),
                    const TextButton(
                      onPressed: null,
                      child: Text("あ"),
                    ),
                    const Divider(),
                    const TextButton(
                      onPressed: null,
                      child: Text("あ"),
                    ),
                    const Divider(),
                    const TextButton(
                      onPressed: null,
                      child: Text("あ"),
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
