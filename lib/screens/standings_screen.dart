import 'package:flutter/material.dart';
import 'package:football/models/standing.dart';
import '../providers/provider.dart' as provider;

class StandingsScreen extends StatefulWidget {
  StandingsScreen({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<StandingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Standing>>(
      future: provider.fetchStandings(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final item = snapshot.data[index];
              return Card(
                  child: ListTile(
                title: Text("${item.team.name}"),
                subtitle: Text("${item.points}"),
              ));
            },
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
