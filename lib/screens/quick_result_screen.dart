import 'package:flutter/material.dart';
import '../utils/def_utils.dart';

class QuickResultScreen extends StatelessWidget {
  final List result;
  QuickResultScreen({@required this.result});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('${result[0]['root']} (${result[0]['source']})'),
          ),
          body: Container(
            padding: EdgeInsets.all(5.0),
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
