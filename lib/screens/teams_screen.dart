import 'package:flutter/material.dart';
import '../providers/provider.dart' as provider;
import '../models/team.dart';

class TeamsScreen extends StatefulWidget {
  TeamsScreen({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TeamsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Team>>(
      future: provider.fetchTeams(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final item = snapshot.data[index];

              return Card(
                  child: ListTile(
                leading: Image(
                  image: NetworkImage(item.logo),
                ),
                title: Text("${item.name}"),
                subtitle: Text("${item.shortCode}"),
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
