import 'package:flutter/material.dart';
import 'package:jopedia/shared/components/component.dart';

class SearchScreen extends StatefulWidget {
  //const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
        backgroundColor: Color(0xff08787F),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Container(
              width: 300.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox( width: 15.0,),
                  Text(
                      'Search'
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

