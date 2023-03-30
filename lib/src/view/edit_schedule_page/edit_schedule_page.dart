import 'package:flutter/material.dart';

class EditSchedulePage extends StatefulWidget {
  const EditSchedulePage({Key? key}) : super(key: key);

  @override
  State<EditSchedulePage> createState() => _EditSchedulePageState();
}

class _EditSchedulePageState extends State<EditSchedulePage> {
  bool isAllDay = false;
  List<Widget> listItems = [
    Container(
      height: 50,
      child: ListTile(
        leading: Text('終日'),
        trailing: Switch(value: false, onChanged: null),
      ),
    ),
    Container(
      height: 50,
      child: ListTile(
        leading: Text('開始'),
        trailing: const Text("2020-01-01"),
      ),
    ),
    Container(
      height: 50,
      child: ListTile(
        leading: Text('終了'),
        trailing: const Text("2020-01-01"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        title: const Text("予定の編集"),
        actions: [
          ElevatedButton(
            child: Text('保存'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            // style: ElevatedButton.styleFrom(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            // ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 60,
            width: double.infinity,
            child: const Card(
              elevation: 0,
              child: TextField(
                decoration: InputDecoration(
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
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return listItems[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: 3,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 140,
            width: double.infinity,
            child: const Card(
              elevation: 0,
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
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
