import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final TextSpan result;
  ResultsScreen({this.result});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: RichText(
                text: result,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
