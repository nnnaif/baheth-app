import 'package:flutter/material.dart';
import 'package:baheth_app/utils/def_utils.dart';

class ResultsScreen extends StatelessWidget {
  final List result;
  ResultsScreen({this.result});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(result[0]['root']),
          ),
          body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: RichText(
                text: highlightDefinition(context, result[0]['content']),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
