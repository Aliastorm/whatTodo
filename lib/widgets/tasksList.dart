import 'package:flutter/material.dart';
import 'package:whentodo_app/models/myTask.dart';
import '../models/myTask.dart';

class TaskList extends StatelessWidget {
  final List<MyTask> myTasks;

  TaskList(this.myTasks);

  @override
  Widget build(BuildContext context) {
    return myTasks.isEmpty
        ? Text("VIDEEEE")
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: myTasks.length,
            itemBuilder: ((context, index) {
              return Text(myTasks[0].name);
            }),
          );
  }
}
