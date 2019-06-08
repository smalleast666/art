import 'package:flutter/material.dart';
import 'art_works_list.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'art',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArtWorks(),
    );
  }
}
