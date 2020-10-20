import 'package:flutter/material.dart';
import '../utils/def_utils.dart';

class SingleResultScreen extends StatelessWidget {
  final Map result;
  SingleResultScreen({@required this.result});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('${result['root']} (${result['source']})'),
          ),
          body: Container(
            padding: EdgeInsets.all(5.0),
            color: Colors.white,
            child: SingleChildScrollView(
              child: RichText(
                text: highlightDefinition(context, result['content']),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
