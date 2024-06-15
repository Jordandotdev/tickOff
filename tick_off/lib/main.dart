import 'package:flutter/material.dart';
import 'package:tick_off/pages/about_page.dart';
import 'package:tick_off/pages/camera_page.dart';
import 'package:tick_off/pages/home_page.dart';
import 'package:tick_off/pages/logout_page.dart';
import 'package:tick_off/pages/settings_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'package:tick_off/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirebaseCheck(),
      title: 'Tick Off',
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/home': (context) => HomePage(),
        '/logout': (context) => LogoutPage(),
        '/about': (context) => AboutPage(),
        '/settings': (context) => SettingsPage(),
        '/signup': (context) => SignUp(),
        '/login': (context) => LoginPage(),
        '/landing': (context) => TaskPage(),
        '/camera': (context) => CameraPage(),
      },
    );
  }
}

class FirebaseCheck extends StatefulWidget {
  const FirebaseCheck({super.key});

  @override
  _FirebaseCheckState createState() => _FirebaseCheckState();
}

class _FirebaseCheckState extends State<FirebaseCheck> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Scaffold(
        body: Center(
          child: Text("Failed to connect to Firebase"),
        ),
      );
    }

    if (!_initialized) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return LoginPage();
  }
}

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaskPage();
  }
}
