import 'package:flutter/material.dart';
import 'package:whentodo_app/models/myTask.dart';
import '../models/myTask.dart';

class TaskList extends StatelessWidget {
  final List<MyTask> myTasks;
  final Function createNewTask;

  TaskList(this.myTasks, this.createNewTask);

  @override
  Widget build(BuildContext context) {
    return myTasks.isEmpty
        ? Column(
            children: [
              Text("New Task"),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => createNewTask(),
              )
            ],
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: myTasks.length,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 5,
                child: ListTile(),
              );
            }),
          );
  }
}
