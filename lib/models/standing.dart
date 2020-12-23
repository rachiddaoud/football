import 'league.dart';
import 'state.dart';
import 'team.dart';

class Standing {
  final int points;
  final String status;
  final String result;
  final League league;
  final Team team;
  final State overall;
  final State home;
  final State away;

  Standing(
      {this.points,
      this.status,
      this.result,
      this.league,
      this.team,
      this.overall,
      this.home,
      this.away});

  factory Standing.fromJson(Map<String, dynamic> json, team, league) {
    return Standing(
      points: json['points'],
      status: json['status'],
      result: json['result'],
      league: league, // find league
      team: team, // find team
      overall: State.fromJson(json['overall']),
      home: State.fromJson(json['home']),
      away: State.fromJson(json['away']),
    );
  }
}
