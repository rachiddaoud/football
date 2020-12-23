class Country {
  final int id;
  final String name;
  final String countryCode;
  final String continent;

  Country({this.id, this.name, this.countryCode, this.continent});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['country_id'],
      name: json['name'],
      countryCode: json['country_code'],
      continent: json['continent'],
    );
  }
}
