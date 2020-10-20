import 'package:flutter/material.dart';
import '../utils/def_utils.dart';
import 'single_result_screen.dart';

const List<String> dictionaries = [
  'لسان العرب',
  'مقاييس اللغة',
  'الصّحّاح في اللغة',
  'القاموس المحيط',
  'العباب الزاخر',
];

class ResultsScreen extends StatelessWidget {
  final List results;
  final String searchTerm;
  ResultsScreen({@required this.results, @required this.searchTerm});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: Text(searchTerm),
              bottom: TabBar(isScrollable: true, tabs: [
                for (String dictionaryTitle in dictionaries)
                  Tab(
                    text: dictionaryTitle,
                  )
              ]),
            ),
            body: TabBarView(children: [
              for (String dictionary in dictionaries)
                ListView(
                  children: [
                    for (Map result in results)
                      if (result['source'] == dictionary)
                        ListTile(
                          title: Text(result['root']),
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SingleResultScreen(result: result)),
                            )
                          },
                        )
                  ],
                )
            ]),
          ),
        ),
      ),
    );
  }
}
