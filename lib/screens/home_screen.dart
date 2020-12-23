import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'dawri el mahali',
        home: Scaffold(
          appBar: AppBar(
            title: Text('dawri el mahali'),
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: Column(
              children: [
                Card(
                  child: InkWell(
                    splashColor: Colors.amberAccent[50],
                    onTap: () {
                      print('hello world');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Ink.image(
                              height: 200,
                              image: AssetImage('assets/img/football.jpg'),
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('NEWS'),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            FlatButton(
                              onPressed: () {},
                              child: Text('Test'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Text('test')
              ],
            ),
          ),
        ));
  }
}
