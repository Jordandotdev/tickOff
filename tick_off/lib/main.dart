import 'package:flutter/material.dart';
import 'package:tick_off/pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'package:tick_off/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Fire
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
      home: LoginPage(),
      title: 'Tick Off',
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/home': (context) => const HomePage(),
        '/signup': (context) => SignUp(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
