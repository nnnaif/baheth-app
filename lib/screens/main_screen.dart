import 'package:flutter/material.dart';
import 'package:baheth_app/utils/def_utils.dart';
import './results_screen.dart';

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
                FlatButton(
                  onPressed: () async {
                    List response = await getDefintion('');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsScreen(result: response),
                      ),
                    );
                  },
                  child: Text(
                    'ابحث',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
