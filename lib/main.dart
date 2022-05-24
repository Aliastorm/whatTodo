import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/myTask.dart';
import './widgets/tasksList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'When to do',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _newActivity() {
    //SHOULD OPEN CREATION WINDOW
    final newActivity = MyTask(
      id: "3",
      name: "Draps",
      description: "changer les draps",
      creationDate: DateTime.now(),
      expectedDate: DateTime.now(),
    );

    setState(() {
      _tasks.add(newActivity);
    });
  }

  final List<MyTask> _tasks = [
    MyTask(
      id: "1",
      name: "Sols",
      description: "Laver les sols",
      creationDate: DateTime.now(),
      expectedDate: DateTime.now().subtract(Duration(days: 2)),
    ),
    MyTask(
      id: "7",
      name: "Fenetres",
      description: "Laver les fenetres",
      creationDate: DateTime.now(),
      expectedDate: DateTime.now().subtract(Duration(days: 30)),
    ),
    MyTask(
      id: "2",
      name: "Couette",
      description: "changer les couettes",
      creationDate: DateTime.now(),
      expectedDate: DateTime.now().add(Duration(days: 4)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final title = "What To do";
    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = (Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'What To DO',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _newActivity(),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text(
              'When To Do',
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _newActivity(),
              ),
            ],
          )) as PreferredSizeWidget;

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(218, 221, 216, 200)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                //    decoration: BoxDecoration(color: Colors.blue),
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.95,
                child: TaskList(_tasks, _newActivity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
