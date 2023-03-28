import 'package:flutter/material.dart';

class ScheduleListPage extends StatefulWidget {
  const ScheduleListPage({Key? key}) : super(key: key);

  @override
  State<ScheduleListPage> createState() => _ScheduleListPageState();
}

class _ScheduleListPageState extends State<ScheduleListPage> {
  @override
  Widget build(BuildContext context) {
    Widget _buildBody() {
      return Stack(
        children: [
          PageView(
            children: [
              Container(
                height: 300,
                width: 20,
                child: Card(
                  child: Text("あ"),
                ),
              ),
              Card(
                child: Text("あ"),
              ),
              Card(
                child: Text("あ"),
              ),
              Card(
                child: Text("あ"),
              ),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("A"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _buildBody();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
