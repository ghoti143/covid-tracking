import 'package:http/http.dart' as http;
import 'dart:convert';

class CovidState {
  final String abbreviation;
  final int positive;
  final int deaths;
  final int recovered;

  CovidState({this.abbreviation, this.positive, this.deaths, this.recovered});

  factory CovidState.fromJson(Map<String, dynamic> json) {
    return CovidState(
      abbreviation: json['state'],
      positive: json['positive'],
      deaths: json['death'],
      recovered: json['recovered'],
    );
  }

  static List<CovidState> parseStates(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CovidState>((json) => CovidState.fromJson(json)).toList();
  }

  static Future<List<CovidState>> fetchCovidStates() async {
    final response = await http.get('https://covidtracking.com/api/v1/states/current.json');

    if (response.statusCode == 200) {
      return parseStates(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
