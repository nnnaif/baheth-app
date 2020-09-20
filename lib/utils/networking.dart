import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<dynamic> getDef(String word) async {
  // Mocking an actual response using an asset file instead of calling the API during development

  // Substring to cutoff eval() from start and end of API response
  var contents = await rootBundle.loadString('assets/data.json');
  final decoded = json.decode(contents.substring(5, contents.length - 1));

  // http.Response res =
  //     await http.get('http://137.74.130.161/rest/baheth/api/$word');
  // final decoded = json.decode(res.body.substring(5, res.body.length - 1));

  return decoded['results'];
}
