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
      id: "123",
      name: "Draps",
      description: "changer les draps",
      creationDate: DateTime.now(),
      expectedDate: DateTime.now(),
    );

    setState(() {
      _tasks.add(newActivity);
    });

    print(_tasks.length);
  }

  final List<MyTask> _tasks = [
    /*MyTask(
       id: "123",
      name: "Draps",
      description: "changer les draps",
      creationDate: DateTime.now(),
      expectedDate: DateTime.now(),
    ),*/
  ];

  @override
  Widget build(BuildContext context) {
    final title = "What to do";
    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = (Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Personal Expenses',
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
              'Personal Expenses',
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _newActivity(),
              ),
            ],
          )) as PreferredSizeWidget;

/*         final PreferredSizeWidget appBar =  Platform.isIOS CupertinoNavigationBar(
      middle: Text("What To Do"),
    trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _newActivity(),
                ),
              ],
            ),
            ) : AppBar(
             title: Text("What To Do"),
             actions: [
              IconButton(onPressed: () => _newActivity(), icon: Icon(Icons.add),),
              ],


            ); */

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(218, 221, 216, 200)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.blue),
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.7,
                child: TaskList(_tasks, _newActivity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
