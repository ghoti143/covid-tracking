// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:covid_tracker/covidStates.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:covid_tracker/ListViewCovidStates.dart';

Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: Material(
        child: child,
      )
    );
}

void main() {
  testWidgets('State renders in list', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final List<CovidState> testStates = [
      new CovidState(abbreviation: 'VA', deaths: 100, recovered: 5, positive: 5000)
    ];

    final widget = makeTestableWidget(
      child: ListViewCovidStates(covidStates: testStates),
    );

    await tester.pumpWidget(widget);

    // Verify that list renders correctly.
    expect(find.text('positive: 5000'), findsOneWidget);
    expect(find.text('deaths: 100'), findsOneWidget);
    expect(find.text('recovered: 5'), findsOneWidget);
    
    // Tap the '+' icon and trigger a frame.
    //await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

  });
}
