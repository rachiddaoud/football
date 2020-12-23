import 'package:flutter/material.dart';
import '../providers/provider.dart' as provider;
import '../models/country.dart';

class CountriesScreen extends StatefulWidget {
  CountriesScreen({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CountriesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Country>>(
      future: provider.fetchCountries(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final item = snapshot.data[index];

              return Card(
                  child: ListTile(
                title: Text("${item.name}"),
                subtitle: Text("${item.countryCode}"),
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
