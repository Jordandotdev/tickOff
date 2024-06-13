import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tick_off/components/my_taskcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

bool show = true;

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue.shade400,
          child: Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade400,
        onTap: navigateBottomBar,
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
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TaskCard();
          },
          itemCount: 10,
        ),
      )),
    );
  }
}
