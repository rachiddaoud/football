import 'package:flutter/material.dart';
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
    return FutureBuilder<List<Match>>(
      future: provider.fetchMatches(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final match = snapshot.data[index];
              return Card(
                  child: Row(
                children: [
                  Image(image: NetworkImage(match.homeTeam.logo)),
                  Text(match.ftScore != null ? match.ftScore : ' - '),
                  Image(image: NetworkImage(match.awayTeam.logo)),
                ],
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
