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

class MyHomePage extends StatelessWidget {
  void _newActivity() {}
  final List<MyTask> _tasks = [
    MyTask(
      id: "123",
      name: "Draps",
      description: "changer les draps",
      creationDate: DateTime.now(),
      expectedDate: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final title = "What to do";

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
        actions: [
          IconButton(onPressed: () => _newActivity(), icon: Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          height: 600,
          child: TaskList(_tasks),
        ),
      ),
    );
  }
}
