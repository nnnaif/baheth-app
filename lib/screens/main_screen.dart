import 'package:flutter/material.dart';
import '../utils/def_utils.dart';
import 'results_screen.dart';
import 'single_result_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String searchTerm;
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
                  onChanged: (input) {
                    searchTerm = input;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchButton(
                        searchType: SearchType.quick, searchTerm: searchTerm),
                    SizedBox(
                      width: 10.0,
                    ),
                    SearchButton(
                      searchType: SearchType.detailed,
                      searchTerm: searchTerm,
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
// quick result screen or a detailed results screen
class SearchButton extends StatelessWidget {
  final SearchType searchType;
  final String searchTerm;

  SearchButton({@required this.searchType, @required this.searchTerm});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color(0xff444444),
      onPressed: () async {
        List response = await getDefintion(searchTerm);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => searchType == SearchType.quick
                ? SingleResultScreen(result: response[0])
                : ResultsScreen(
                    results: response,
                    searchTerm: searchTerm,
                  ),
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
