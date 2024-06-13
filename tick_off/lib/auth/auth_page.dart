import 'package:flutter/material.dart';
import 'package:tick_off/pages/login_page.dart';
import 'package:tick_off/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LoginPage();
    } else {
      return SignUp();
    }
  }
}
