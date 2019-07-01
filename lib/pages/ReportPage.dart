import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vistor_log/models/employeebloc.dart';
import 'package:vistor_log/models/employees.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
     final appState = Provider.of<EmployeeState>(context);

    return Container(
      child: FutureBuilder<Employee>(
        future: appState.fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Data:" + snapshot.data.title);
            return Text(snapshot.data.title);
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
