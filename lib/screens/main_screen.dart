import 'package:flutter/material.dart';
import 'package:baheth_app/utils/networking.dart';
import 'package:simple_html_css/simple_html_css.dart';
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
                    List response = await getDef('');
                    var htmlResponse = response[0]['content'];
                    var result = HTML.toTextSpan(
                      context,
                      htmlResponse + '<br>',
                      overrideStyle: {
                        'span': TextStyle(backgroundColor: Colors.yellow),
                      },
                      defaultTextStyle: TextStyle(
                          fontSize: 15, inherit: false, color: Colors.black),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsScreen(result: result),
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
