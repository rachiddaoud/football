import 'dart:convert';
import 'package:football/models/league.dart';
import 'package:football/models/standing.dart';
import '../models/country.dart';
import '../models/team.dart';
import '../models/match.dart';
import 'package:flutter/services.dart' show rootBundle;
//import 'package:http/http.dart' as http;

Future<List<Match>> fetchMatches() async {
  List<Match> models = new List<Match>();
  final response = await rootBundle.loadString('assets/json/matches.json');
  var leagues = await fetchLeagues();
  for (final data in jsonDecode(response)['data']) {
    models.add(Match.fromJson(
      data,
      leagues.where((i) => i.id == data['league_id']).single,
    ));
  }
  return models;
  /*final response = await http.get(
      'https://app.sportdataapi.com/api/v1/soccer/matches?apikey=8b91bcd0-42cc-11eb-9310-5942502ad1e8&season_id=15');

  if (response.statusCode == 200) {
    var contriesJson = jsonDecode(response.body);
    final data = contriesJson['data'];
    for (final keyName in data.keys) {
      models.add(Country.fromJson(data[keyName]));
    }
    return models;
  } else {
    throw Exception('Failed to load countries');
  }*/
}

Future<List<Country>> fetchCountries() async {
  List<Country> models = new List<Country>();
  final response = await rootBundle.loadString('assets/json/countries.json');
  for (final data in jsonDecode(response)['data']) {
    models.add(Country.fromJson(data));
  }
  return models;
  /*final response = await http.get(
      'https://app.sportdataapi.com/api/v1/soccer/countries?apikey=8b91bcd0-42cc-11eb-9310-5942502ad1e8&continent=Africa');

  if (response.statusCode == 200) {
    var contriesJson = jsonDecode(response.body);
    final data = contriesJson['data'];
    for (final keyName in data.keys) {
      models.add(Country.fromJson(data[keyName]));
    }
    return models;
  } else {
    throw Exception('Failed to load countries');
  }*/
}

Future<List<Standing>> fetchStandings() async {
  List<Standing> models = new List<Standing>();
  final response = await rootBundle.loadString('assets/json/standings.json');
  var teams = await fetchTeams();
  var leagues = await fetchLeagues();
  var data = jsonDecode(response)['data'];
  for (final standing in data['standings']) {
    try {
      models.add(Standing.fromJson(
        standing,
        teams.where((i) => i.id == standing['team_id']).single,
        leagues.where((i) => i.id == data['league_id']).single,
      ));
    } catch (e) {
      // print(standing['team_id']);
    }
  }
  models.sort((a, b) => b.points - a.points);
  return models;
  /*final response = await http.get(
      'https://app.sportdataapi.com/api/v1/soccer/standings?apikey=8b91bcd0-42cc-11eb-9310-5942502ad1e8&season_id=15');

  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    var data = json['data'];
    for (final standing in data['standings']) {
      models.add(Standing.fromJson(
        standing,
        teams.where((i) => i.id == standing['team_id']).single,
        leagues.where((i) => i.id == data['league_id']).single,
      ));
    }
    return models;
  } else {
    throw Exception('Failed to load countries');
  }*/
}

Future<List<Team>> fetchTeams() async {
  List<Team> models = new List<Team>();
  final response = await rootBundle.loadString('assets/json/teams.json');
  for (final data in jsonDecode(response)['data']) {
    models.add(Team.fromJson(data));
  }
  return models;
  /*final response = await http.get(
      'https://app.sportdataapi.com/api/v1/soccer/teams?apikey=8b91bcd0-42cc-11eb-9310-5942502ad1e8&country_id=10');
  
  if (response.statusCode == 200) {
    for (final data in jsonDecode(response.body)['data']) {
      models.add(Team.fromJson(data));
    }
    return models;
  } else {
    throw Exception('Failed to load teams');
  }*/
}

Future<List<League>> fetchLeagues() async {
  List<League> models = new List<League>();
  final response = await rootBundle.loadString('assets/json/leagues.json');
  for (final data in jsonDecode(response)['data']) {
    models.add(League.fromJson(data));
  }
  return models;
  /*final response = await http.get(
      'https://app.sportdataapi.com/api/v1/soccer/leagues?apikey=8b91bcd0-42cc-11eb-9310-5942502ad1e8');

  if (response.statusCode == 200) {
    var leaguesJson = jsonDecode(response.body);
    for (final league in leaguesJson['data']) {
      leagues.add(League.fromJson(league));
    }
    return leagues;
  } else {
    throw Exception('Failed to load leagues');
  }*/
}
