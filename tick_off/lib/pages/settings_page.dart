import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tick_off/components/my_stylebox.dart';
import 'package:tick_off/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = true;
  XFile? _tempImage;

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Account widget
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/camera',
                    arguments: _tempImage, // Pass the initial image if any
                  ).then((selectedPhoto) {
                    if (selectedPhoto != null) {
                      setState(() {
                        _tempImage = selectedPhoto as XFile?;
                      });
                    }
                  });
                },
                child: StyleBox(
                  heading: 'Account',
                  description: 'Tap here to update your account details',
                  trailingContent: _tempImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            File(_tempImage!.path),
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(Icons.person, size: 70), // Icon
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
