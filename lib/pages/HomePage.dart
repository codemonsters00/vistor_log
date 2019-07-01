import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vistor_log/models/employeebloc.dart';
import 'package:vistor_log/searchDelegate.dart';

import 'AddVisitor.dart';
import 'ReportPage.dart';
import 'SearchPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  Widget _title = Text("Visitor Log");
  String searchbtn = "";
  final _pageOptions = [AddVisitorPage(), SearchPage(), ReportPage()];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: MaterialApp(
          theme: ThemeData(
            primaryColor: Color(0xff01A0C7),
            primarySwatch: Colors.blue,
          ),
          home: ChangeNotifierProvider<EmployeeState>(
            builder: (BuildContext context) => EmployeeState(),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xff01A0C7),
                centerTitle: true,
                title: _title,
                actions: [
                  searchbtn == "Search Visitor"
                      ? IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            showSearch(
                                context: context, delegate: CustomDelegate());
                          },
                        )
                      : Container()
                ],
              ),
              body: _pageOptions[_selectedindex],
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Color(0xff01A0C7),
                currentIndex: _selectedindex,
                onTap: (int index) {
                  setState(() {
                    _selectedindex = index;
                    if (index == 1) {
                      _title = Text("Search Visitor");
                      searchbtn = "Search Visitor";
                    }
                    if (index == 2) {
                      _title = Text("Visitors Report");
                      searchbtn = "";
                    }
                    if (index == 0) {
                      _title = Text("Visitor's Log");
                      searchbtn = "";
                    }
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
            ),
          )),
    );
  }
}
