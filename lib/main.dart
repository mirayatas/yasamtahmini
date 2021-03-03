import 'package:flutter/material.dart';
import 'package:yasamtahmini/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.lightBlue[300],
          primaryColor: Colors.lightBlue[300]),
      home: InputPage(),
    );
  }
}
