import 'league.dart';
import 'team.dart';

class Match {
  final int id;
  final int statusCode;
  final String status;
  final String matchStart;
  final League league;
  final Team homeTeam;
  final Team awayTeam;
  final int homeScore;
  final int awayScore;
  final String htScore;
  final String ftScore;
  final String etScore;
  final String psScore;
  final String venuName;
  final String venuCity;

  Match({
    this.id,
    this.statusCode,
    this.status,
    this.matchStart,
    this.league,
    this.homeTeam,
    this.awayTeam,
    this.homeScore,
    this.awayScore,
    this.htScore,
    this.ftScore,
    this.etScore,
    this.psScore,
    this.venuName,
    this.venuCity,
  });

  factory Match.fromJson(Map<String, dynamic> json, league) {
    return Match(
      id: json['match_id'],
      statusCode: json['status_code'],
      status: json['status'],
      league: league,
      homeTeam: Team.fromJson(json['home_team']),
      awayTeam: Team.fromJson(json['away_team']),
      homeScore: json['home_score'],
      awayScore: json['away_score'],
      htScore: json['stats']['ht_score'],
      ftScore: json['stats']['ft_score'],
      etScore: json['stats']['et_score'],
      psScore: json['stats']['ps_score'],
      venuName: json.containsKey(['venue']) ? json['venue']['name'] : '',
      venuCity: json.containsKey(['venue']) ? json['venue']['city'] : '',
    );
  }
}
