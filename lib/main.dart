import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hub N Spoke',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<AppIconData> appIcons = [
    // add icon to corner of app to get to home
    AppIconData(icon: Icons.settings, label: 'Settings', page: SettingsPage()),
    AppIconData(icon: Icons.settings, label: 'Settings', page: SettingsPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Hub N Spoke')
        )
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: appIcons.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => appIcons[index].page),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(appIcons[index].icon, size: 50.0),
                SizedBox(height: 8.0),
                Text(appIcons[index].label),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 50,
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            child: const Center(child: Text('Entry C')),
          ),
        ],
      )
    );
  }
}

class AppIconData {
  final IconData icon;
  final String label;
  final Widget page;

  AppIconData({required this.icon, required this.label, required this.page});
}
