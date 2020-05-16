import 'package:flutter/material.dart';
import 'dart:developer';
import 'covidStates.dart';

class ListViewCovidStates extends StatelessWidget {
  final List<CovidState> covidStates;
 
  ListViewCovidStates({Key key, this.covidStates}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: covidStates.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  title: Text('${covidStates[position].abbreviation}'),
                  subtitle:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('positive: ${covidStates[position].positive}'),
                        Text('deaths: ${covidStates[position].deaths}'),
                        Text('recovered: ${covidStates[position].recovered}'),
                      ],
                  ), 
                  onTap: () => _onTapItem(context, covidStates[position]),
                ),
              ],
            );
          }),
    );
  }
 
  void _onTapItem(BuildContext context, CovidState covidState) { log('foo'); }
}
