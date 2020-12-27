import 'package:flutter/material.dart';
import 'package:football/screens/teams_screen.dart';
import '../providers/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dawri el mahali',
      home: Scaffold(
          appBar: AppBar(
            title: Text('dawri el mahali'),
            backgroundColor: Colors.lightGreen,
            centerTitle: true,
            leading: IconButton(
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
            ],
          ),
          body: Column(
            children: [
              Stack(
                children: [],
              ),
            ],
          )),
    );
  }
}
