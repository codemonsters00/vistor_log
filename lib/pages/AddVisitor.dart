import 'package:flutter/material.dart';

import 'package:vistor_log/models/employees.dart';


class AddVisitorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddVisitorPageState();
  }
}

class AddVisitorPageState extends State<AddVisitorPage> {
  Future<Employee> employee;
  String dropdownValue = 'One';
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);





  Widget build(BuildContext context) {
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
        onPressed: () {},
        child: Text("Record",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return new Center(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 5.0,
          ),
          Text(
            "VISITOR DETAILS",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: TextField(
              decoration: InputDecoration(hintText: "Name"),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Phone",
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          new ListTile(
            leading: const Icon(Icons.email),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.person),
            title: DropdownButton<String>(
                value: dropdownValue,
                hint: Text("Staff Name"),
                onChanged: (String text) {
                  setState(() {
                    dropdownValue = text;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()),
          ),
          SizedBox(
            height: 35.0,
          ),
          loginButon,
          SizedBox(
           
            height: 35.0,
          ),
        ],
      ),
    ));
  }
}
