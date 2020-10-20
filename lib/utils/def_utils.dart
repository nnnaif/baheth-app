// Contains utilities releated to fetching word definitinos and their presentation.

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<dynamic> getDefintion(String word) async {
  // Mocking an actual response using an asset file instead of calling the API during development

  // Substring to cutoff eval() from start and end of API response
  var contents = await rootBundle.loadString('assets/data.json');
  final decoded = json.decode(contents.substring(5, contents.length - 1));

  /* http.Response res =
      await http.get('http://137.74.130.161/rest/baheth/api/$word');
  final decoded = json.decode(res.body.substring(5, res.body.length - 1)); */
  return decoded['results'];
}

// Applies Yellow background on words related to search term based on HTML tags.
TextSpan highlightDefinition(BuildContext context, String definition) {
  var highlightedDefinition = HTML.toTextSpan(
    context,
    definition + '<br>',
    overrideStyle: {
      'span': TextStyle(backgroundColor: Colors.yellow),
    },
    defaultTextStyle:
        TextStyle(fontSize: 15, inherit: false, color: Colors.black),
  );
  return highlightedDefinition;
}
