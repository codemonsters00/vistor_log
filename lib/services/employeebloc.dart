import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vistor_log/models/employees.dart';
import 'package:http/http.dart' as http;

class EmployeeState extends ChangeNotifier {
 
 String jsonEmployees = "";
 bool isLoadingEmp = false;

  Future<Employee> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/todos/1');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Employee.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
