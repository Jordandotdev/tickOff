import 'package:flutter/material.dart';
import 'package:tick_off/data/about_data.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getAboutData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final aboutData = snapshot.data!;
            return Column(
              children: [
                Text(aboutData['title'], style: TextStyle(fontSize: 24)),
                SizedBox(height: 8),
                Text(aboutData['description']),
                // Add more widgets to display other data
              ],
            );
          }
        },
      ),
    );
  }
}
