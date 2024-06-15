import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tick_off/data/firestore.dart';
import 'package:tick_off/pages/add_task_page.dart';
import 'package:tick_off/components/my_taskcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

bool show = true;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Add_Screen(),
            ));
          },
          backgroundColor: Colors.blue.shade400,
          child: Icon(Icons.add),
        ),
      ),
      body: SafeArea(
          child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification is UserScrollNotification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            } else if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
          }
          return true;
        },
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore_Datasource().stream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              final noteslist = Firestore_Datasource().getNotes(snapshot);
              return ListView.builder(
                itemBuilder: (context, index) {
                  final note = noteslist[index];
                  return TaskCard(note);
                },
                itemCount: noteslist.length,
              );
            }),
      )),
    );
  }
}
