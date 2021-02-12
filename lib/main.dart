import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow,
        // scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(color: Colors.red[900]),
      ),
      home: Home(), //call MyFile List
    );
  }
}
