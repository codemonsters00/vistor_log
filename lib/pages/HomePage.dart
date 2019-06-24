import 'package:flutter/material.dart';

import 'AddVisitor.dart';
import 'ReportPage.dart';
import 'SearchPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{
 int _selectedindex = 0;
  final _pageOptions = [
    AddVisitorPage(),
    SearchPage(),
    ReportPage()

  ];
  @override
  Widget build(BuildContext context) {
  
    return WillPopScope(
      onWillPop:()=>Future.value(false),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
          ),
          body: _pageOptions[_selectedindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedindex,
            onTap: (int index) {
              setState(() {
                 _selectedindex = index;
              });
             
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box),
                title: Text('Add Visitor'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart),
                title: Text('Reports'),
              )
            ],
          ),
        )),) ;
  }
}