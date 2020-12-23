class League {
  final int id;
  final int countryId;
  final String name;

  League({this.id, this.name, this.countryId});

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
        id: json['league_id'],
        name: json['name'],
        countryId: json['country_id']);
  }
}
