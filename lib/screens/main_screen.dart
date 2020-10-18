import 'package:flutter/material.dart';
import '../utils/def_utils.dart';
import 'results_screen.dart';
import 'quick_result_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('الباحث العربي'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (input) {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchButton(
                      searchType: SearchType.detailed,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    SearchButton(
                      searchType: SearchType.quick,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum SearchType { detailed, quick }

// Depending on the searchType parameter, the button will route to either a
// best result screen or a detailed results screen
class SearchButton extends StatelessWidget {
  final SearchType searchType;

  SearchButton({@required this.searchType});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color(0xff444444),
      onPressed: () async {
        List response = await getDefintion('');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => searchType == SearchType.quick
                ? QuickResultScreen(result: response)
                : ResultsScreen(result: response),
          ),
        );
      },
      child: Text(
        searchType == SearchType.quick ? 'بحث سريع' : 'ابحث',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
