import 'package:art/navigationBar.dart';
import 'package:art/pages/upload_img.dart';
import 'package:flutter/material.dart';

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
      home: NavigationBar(),
      routes: {
        'up-load-img': (context) => UpLoadImg(),
      },
    );
  }
}
