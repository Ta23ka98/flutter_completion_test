import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  String? selectedItem = "2021年 08月";
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("カレンダー"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  // style: ButtonStyle(
                  //
                  // ),
                  onPressed: () {},
                  child: const Text(
                    "今日",
                    style: TextStyle(color: Colors.black),
                  )),
              const SizedBox(
                width: 30,
              ),
              DropdownButton(
                value: selectedItem,
                items: const [
                  DropdownMenuItem(
                    value: "2021年 08月",
                    child: Text("2021年 08月"),
                  ),
                  DropdownMenuItem(
                    value: "2021年 09月",
                    child: Text("2021年 09月"),
                  ),
                  DropdownMenuItem(
                    value: "2021年 10月",
                    child: Text("2021年 10月"),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
              ),
              const SizedBox(
                width: 90,
              ),
            ],
          ),
          TableCalendar(
              headerVisible: false,
              headerStyle: const HeaderStyle(),
              // headerStyle: HeaderStyle(
              //   leftChevronIcon: Icon(Icons.add),
              //   rightChevronIcon: SizedBox(),
              //   leftChevronMargin: EdgeInsets.symmetric(horizontal: 0),
              //   leftChevronPadding: EdgeInsets.symmetric(horizontal: 0),
              //   titleCentered: true,
              //   formatButtonVisible: false,
              //   rightChevronVisible: true,
              // ),
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 1, 1)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return PageView(
                  children: dialogs,
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
