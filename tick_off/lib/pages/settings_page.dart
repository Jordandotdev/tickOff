import 'package:flutter/material.dart';
import 'package:tick_off/components/my_stylebox.dart';
import 'package:tick_off/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = true; // Initial state is light mode

  @override
  void initState() {
    super.initState();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    isSwitched = themeProvider.themeData !=
        ThemeData.dark(); // Check if the current theme is not dark
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final brightness = Theme.of(context).brightness;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            //account widget
            const StyleBox(
              heading: 'Account',
              description: 'Settings for your account',
              trailingContent: Icon(Icons.person, size: 70), // Icon
            ),

            const SizedBox(height: 10),

            //notifications widget
            const StyleBox(
              heading: 'Security',
              description: 'Settings for your account security',
              trailingContent: Icon(Icons.security, size: 70), // Icon
            ),

            const SizedBox(height: 10),

            //dark Mode toggle
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
    );
  }
}
