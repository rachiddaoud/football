import 'package:flutter/material.dart';
import '../models/match.dart';

class DayMatches extends StatelessWidget {
  final List<Match> matches;

  DayMatches(this.matches);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: matches.length * 50.0,
      child: ListView.builder(
        itemCount: this.matches.length,
        itemBuilder: (context, index) {
          var match = this.matches[index];
          return Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(match.homeTeam.logo),
                radius: 20.0,
              ),
              SizedBox(width: 20.0),
              Text(match.ftScore != null
                  ? match.ftScore
                  : '${match.matchStart.toString()} ${match.status}'),
              SizedBox(width: 20.0),
              CircleAvatar(
                backgroundImage: NetworkImage(match.awayTeam.logo),
                radius: 20.0,
              ),
            ],
          ));
        },
      ),
    );
  }
}
