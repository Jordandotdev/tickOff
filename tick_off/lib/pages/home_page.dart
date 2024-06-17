import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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

class _HomePageState extends State<HomePage> {
  ConnectivityResult? connectivityResult;
  bool show = true;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  void checkConnectivity() async {
    var result = await (Connectivity().checkConnectivity());
    setState(() {
      connectivityResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            if (connectivityResult == ConnectivityResult.none) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('No internet connection'),
              ));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Add_Screen(),
              ));
            }
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
                return Center(child: CircularProgressIndicator());
              }
              final notesList = Firestore_Datasource().getNotes(snapshot);
              return ListView.builder(
                itemBuilder: (context, index) {
                  final note = notesList[index];
                  return TaskCard(note);
                },
                itemCount: notesList.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
