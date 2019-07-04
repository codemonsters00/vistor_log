import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vistor_log/pages/AddVisitor.dart';
import 'package:vistor_log/pages/ReportPage.dart';
import 'package:vistor_log/pages/SearchPage.dart';

class PageState extends ChangeNotifier {
  int _selectedindex = 0;
  final _pageOptions = [AddVisitorPage(), SearchPage(), ReportPage()];
  Widget _title = Text("Visitor Log");
  String searchbtn = "";

  int get selectedindex => _selectedindex;
  Widget get title => _title;

  List<Widget> get pageOptions => _pageOptions;

  void setIndex(int index) {
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
    notifyListeners();
  }
}
