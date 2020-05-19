import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'covidStates.dart';
import 'ListViewCovidStates.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Tracking Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Covid Tracking Data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  Future<List<CovidState>> futureCovidStates;

  @override
  void initState() {
    super.initState();
    futureCovidStates = CovidState.fetchCovidStates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<CovidState>>(
            future: futureCovidStates,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
          
              return snapshot.hasData
                  ? ListViewCovidStates(covidStates: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      );
  }
}
