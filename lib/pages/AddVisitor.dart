import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vistor_log/services/vistor.bloc.dart';


class AddVisitorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddVisitorPageState();
  }
}

class AddVisitorPageState extends State<AddVisitorPage> {
 
  GlobalKey<FormState> _key = GlobalKey();
  String dropdownValue = 'One';
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  
  final Map<String, dynamic> _formData = {
    'name': null,
    'phone': null,
    'email': null,
    'staffToSee': null,
    'seen': 'true' 
  };

  Widget _buildNumberTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Phone'),
      validator: (String value) {
        // if (value.trim().length <= 0) {
        if (value.isEmpty ) {
          return 'Phone is required and should be a number.';
        }
      },
      onSaved: (String value) {
        _formData['phone'] = value;
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
        _formData['name'] = name;
      },
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        // if (value.trim().length <= 0) {
        if (value.isEmpty || !value.contains("@") || !value.contains(".")) {
          return 'Enter Valid Email.';
        }
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }

  void _submitForm() {
    
    if (!_key.currentState.validate()) {
      return;
    }
    _key.currentState.save();
     
     
  }

  Widget build(BuildContext context) {
    final visitor = Provider.of<VisitorState>(context);
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
        onPressed: () {
              final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {

                // Some code to undo the change.
              },
            ),
          );  
          _submitForm();
           visitor.recordVisit(_formData).then( (bool value){
             if (value){
              Scaffold.of(context).showSnackBar(snackBar);
             }
           });
         

        },
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

                  _formData['staffToSee'] = text;
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
