import 'country.dart';

class Team {
  final int id;
  final String name;
  final String shortCode;
  final String logo;
  final Country country;

  Team({this.id, this.name, this.shortCode, this.logo, this.country});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['team_id'],
      name: json['name'],
      shortCode: json['short_code'],
      logo: json['logo'],
      country: json.containsKey(['country'])
          ? Country.fromJson(json['country'])
          : null,
    );
  }
}
