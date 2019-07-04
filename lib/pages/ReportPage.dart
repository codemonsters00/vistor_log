import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vistor_log/models/employees.dart';


import 'package:vistor_log/services/employeebloc.dart';
 import 'package:vistor_log/services/vistor.bloc.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<EmployeeState>(context);
     final visitortest = Provider.of<VisitorState>(context);
     Map<String, dynamic> map = {'name': 'man', 'sex': 'females','sex': 'females','sex': 'females','sex': 'females'};
     visitortest.recordVisit(map);
   

    return Container(
     
       child: FutureBuilder<Employee>(
         future: appState.title,
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             print("Data:" + snapshot.data.title);
             return Text(snapshot.data.title);
           } else if (snapshot.hasError) {
             print(snapshot.error);
             return Text("${snapshot.error}");
           }

           // By default, show a loading spinner.
           return Center(child: CircularProgressIndicator());
         },
       ),
    );
  }
}
