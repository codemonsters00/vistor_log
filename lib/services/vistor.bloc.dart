
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class VisitorState extends ChangeNotifier {
  Future<Null> recordVisit(Map<String, dynamic> record) async {
    final response = await http.post('http://192.168.100.7:45455/api/values',
        body: (record),headers:{'Content-Type': 'application/x-www-form-urlencoded'});

    if (response.statusCode == 200) {
      AlertDialog(
        title: Text("hi"),
      );
    } else {}
  }
}
