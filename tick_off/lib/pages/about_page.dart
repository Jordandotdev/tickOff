import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tick_off/data/about_data.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late Future<Map<String, dynamic>> aboutData;
  ConnectivityResult? connectivityResult;

  @override
  void initState() {
    super.initState();
    aboutData = getAboutData();
    checkConnectivity();
  }

  void checkConnectivity() async {
    var result = await (Connectivity().checkConnectivity());
    setState(() {
      connectivityResult = result;
    });

    // Optionally, subscribe to connectivity changes
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        connectivityResult = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: aboutData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final aboutData = snapshot.data!;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      aboutData['title'],
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      aboutData['description'],
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 100),
                    if (connectivityResult == ConnectivityResult.none)
                      Text(
                        'Connect to the internet to see your version',
                        style: TextStyle(color: Colors.red),
                      )
                    else
                      Text(
                        aboutData['version'],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
