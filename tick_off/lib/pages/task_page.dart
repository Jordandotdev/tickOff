import 'package:flutter/material.dart';
import 'package:tick_off/components/my_taskcard.dart';

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Map<String, dynamic>> tasks = [
    {
      'title': 'Task 1',
      'description': 'This is the first task.',
      'isDone': false,
    },
    {
      'title': 'Task 2',
      'description': 'This is the second task.',
      'isDone': true,
    },
    // Add more tasks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskCard();
        },
      ),
    );
  }
}
