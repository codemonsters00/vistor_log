import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vistor_log/services/pagebloc.dart';
import 'pages/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PageState>(
                builder: (BuildContext context) => PageState(),
        child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: (LoginPage())));
  }
}
