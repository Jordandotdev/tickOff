import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  Future<void> logoutAndNavigate(BuildContext context) async {
    await FirebaseAuth.instance.signOut(); // Sign out the user
    Navigator.pushReplacementNamed(context, '/login'); // Navigate to login page
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Logout Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user != null ? 'Logged in as ${user.email}' : 'Not logged in'),
            SizedBox(height: 20), // Space between text and button
            ElevatedButton(
              onPressed: () => logoutAndNavigate(context),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
