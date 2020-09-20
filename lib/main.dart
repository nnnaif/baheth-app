import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(Baheth());
}

class Baheth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
