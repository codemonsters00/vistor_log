import 'package:flutter/material.dart';
import 'pages/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: (LoginPage())));
  }
}
