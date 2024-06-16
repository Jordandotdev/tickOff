import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tick_off/components/my_stylebox.dart';
import 'package:tick_off/pages/camera_page.dart';
import 'package:tick_off/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'dart:io'; // Import dart:io for File operations

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = true; // Initial state is light mode
  XFile? _tempImage; // Variable to hold the temporary image

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    isSwitched = themeProvider.themeData !=
        ThemeData.dark(); // Check if the current theme is not dark
    final args = ModalRoute.of(context)?.settings.arguments as XFile?;
    if (args != null) {
      setState(() {
        _tempImage = args;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              if (_tempImage != null)
                Image.file(
                  File(_tempImage!.path),
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 10),
              // Account widget
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraPage()),
                  );
                },
                child: const StyleBox(
                  heading: 'Account',
                  description: 'Tap here to update your account details',
                  trailingContent: Icon(Icons.person, size: 70), // Icon
                ),
              ),
              const SizedBox(height: 10),
              // Notifications widget
              const StyleBox(
                heading: 'Security',
                description: 'Settings for your account security',
                trailingContent: Icon(Icons.security, size: 70), // Icon
              ),
              const SizedBox(height: 10),
              // Dark Mode toggle
              StyleBox(
                heading: 'Dark Mode',
                description: 'Toggle dark mode on or off',
                trailingContent: Switch(
                  value: isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitched = value;
                    });
                    themeProvider.toggleTheme();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
