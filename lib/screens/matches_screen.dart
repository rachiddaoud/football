import 'package:flutter/material.dart';
import 'package:football/widgets/dayMatches.dart';
import '../providers/provider.dart' as provider;
import '../models/match.dart';

class MatchesScreen extends StatefulWidget {
  MatchesScreen({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MatchesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<Match>>>(
      future: provider.fetchMatches(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final matchesPerDay = snapshot.data;
          return ListView(
            children: matchesPerDay
                .map((matches) => Column(
                      children: [
                        Text(matches[0].matchStart.toString()),
                        DayMatches(matches)
                      ],
                    ))
                .toList(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
