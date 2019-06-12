import 'package:art/navigationBar.dart';
import 'package:art/pages/upload_img.dart';
import 'package:art/stores/main_store.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainStore>(
      model: MainStore(),
      child: MaterialApp(
        title: 'art',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NavigationBar(),
        routes: {
          'up-load-img': (context) => UpLoadImg(),
        },
      ),
    );
  }
}
