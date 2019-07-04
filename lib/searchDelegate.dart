import 'package:flutter/material.dart';

class CustomDelegate extends SearchDelegate<String>  {
  final list = ["name", "John", "age", "car", "dog", "cow"];
  final recentlist = ["sample", "sample2", "dog"];
  @override
  List<Widget> buildActions(BuildContext context) {

    

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          close(context, null);
        },
      )
    ];
    
  }
  

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    final suggestionList = query.isEmpty
        ? recentlist
        : list.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
            onTap:(){
               showModalBottomSheet<void>(context: context,
    builder: (BuildContext context) {
      return  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            leading:  Icon(Icons.person),
            title:  Text(suggestionList[index]),
            onTap: () {},          
          ),
           ListTile(
            leading:  Icon(Icons.photo_album),
            title:  Text('Photos'),
            onTap: () {},          
          ),
           ListTile(
            leading:  Icon(Icons.videocam),
            title:  Text('Video'),
            onTap: (){},          
          ),
        ],
      );
   });
            },
            leading: Icon(Icons.location_city),
            title: RichText(
              text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey)),
                  ]),
            ),
          ),
      itemCount: suggestionList.length,
    );
  }
}
