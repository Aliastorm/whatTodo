import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:whentodo_app/models/myTask.dart';
import '../models/myTask.dart';

class TaskList extends StatelessWidget {
  final List<MyTask> myTasks;
  final Function createNewTask;

  TaskList(this.myTasks, this.createNewTask);

  var newFormat = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return myTasks.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New Task",
                style: TextStyle(fontSize: 50),
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline_rounded),
                iconSize: 100,
                onPressed: () => createNewTask(),
              )
            ],
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: myTasks.length,
            itemBuilder: ((context, index) {
              return Card(
                margin: EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 10,
                ),
                elevation: 5,
                child: ListTile(
                  leading: Icon(
                    Icons.watch,
                    color: Colors.red,
                  ),
                  title: Text(myTasks[index].name),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Creation Date"),
                          Text(newFormat.format(myTasks[index].creationDate))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expected Date"),
                          Text(newFormat.format(myTasks[index].expectedDate)),
                        ],
                      )
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => {},
                  ),
                ),
              );
            }),
          );
  }
}
