import 'package:flutter/material.dart';
import 'package:vistor_log/models/vistor.dart';

class AddVisitorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddVisitorPageState();
  }
}

class AddVisitorPageState extends State<AddVisitorPage> {
  Visitor visitor;
  GlobalKey<FormState> _key = GlobalKey();
  String dropdownValue = 'One';
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Widget _buildNumberTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Phone'),
      validator: (String value) {
        // if (value.trim().length <= 0) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number.';
        }
      },
      onSaved: (String value) {

      },
    );
  }

  Widget _buildNameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        // if (value.trim().length <= 0) {
        if (value.isEmpty || value.length < 5) {
          return 'Name is required and should be 5+ characters long.';
        }
      },
      onSaved: (String name) {
        visitor.name= name;
      },
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        // if (value.trim().length <= 0) {
        if (value.isEmpty || !value.contains("@") || value.contains(".")) {
          return 'Enter Valid Email.';
        }
      },
      onSaved: (String value) {},
    );
  }

  // void _submitForm() {
  //   if (!_key.currentState.validate()) {
  //     return;
  //   }
  //   _key.currentState.save();
   
  //   Navigator.pushReplacementNamed(context, '/products');
  // }

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
    return Center(
        child: SingleChildScrollView(
      child: Form(
        key: _key,
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
              title: _buildNameTextField(),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: _buildNumberTextField(),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
                leading: const Icon(Icons.email),
                title: _buildEmailTextField()),
            ListTile(
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
      ),
    ));
  }
}
