import 'package:flutter/material.dart';
import 'standings_screen.dart';
import 'teams_screen.dart';
import 'countries_screen.dart';
import 'leagues_screen.dart';
import 'matches_screen.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    StandingsScreen(),
    TeamsScreen(),
    MatchesScreen(),
    //LeaguesScreen(),
    //CountriesScreen(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.sports_soccer),
            label: 'Standings',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.sports_soccer),
            label: 'Teams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.military_tech),
            label: 'Match',
          ),
        ],
      ),
    );
  }
}
