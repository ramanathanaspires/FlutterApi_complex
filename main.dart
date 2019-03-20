import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.yellow
      ),
      home: new HomePage(),
    );
  }
}



