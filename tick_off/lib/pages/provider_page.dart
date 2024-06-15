import 'package:flutter/material.dart';
import 'package:tick_off/pages/about_page.dart';
import 'package:tick_off/pages/home_page.dart';
import 'package:tick_off/pages/login_page.dart';
import 'package:tick_off/pages/settings_page.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  //navigate function
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages
  final List<Widget> _pages = [
    HomePage(),
    AboutPage(),
    SettingsPage(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_mark), label: 'About'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'logout'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade400,
        onTap: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
