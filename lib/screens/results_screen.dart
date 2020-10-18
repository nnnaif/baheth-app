import 'package:flutter/material.dart';
import '../utils/def_utils.dart';

const List<String> dictionaries = [
  'لسان العرب',
  'مقاييس اللغة',
  'الصّحّاح في اللغة',
  'القاموس المحيط',
  'العباب الزاخر',
];

class ResultsScreen extends StatelessWidget {
  final List result;
  ResultsScreen({@required this.result});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: Text('${result[0]['root']}'),
              bottom: TabBar(isScrollable: true, tabs: [
                for (String dictionaryTitle in dictionaries)
                  Tab(
                    text: dictionaryTitle,
                  )
              ]),
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
      ),
    );
  }
}
