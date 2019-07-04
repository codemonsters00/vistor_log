
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class VisitorState extends ChangeNotifier {

  
String title ="";

final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              }));

  Future<bool> recordVisit(Map<String, dynamic> record) async {
    final response = await http.post('http://192.168.100.15:45455/api/values',
        body: (record),headers:{'Content-Type': 'application/x-www-form-urlencoded'});
        
            if (response.statusCode == 200) {
              return true;
              
            }
            
             else {

               return false;
             }


          }
        
  
}

