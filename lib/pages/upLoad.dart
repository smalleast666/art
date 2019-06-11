

import 'package:flutter/material.dart';

class UpLoad extends StatefulWidget {
  UpLoad({Key key}) : super(key: key);

  _UpLoadState createState() => _UpLoadState();
}

class _UpLoadState extends State<UpLoad> {
  List<String> _tabs = <String>['上传图片', '上传作品'];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
        child: Column(
          children: _tabs.map<Widget>((String tab) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("up-load-img", arguments: 'photo');
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(tab),
              ),
            );
          }).toList()
       ),
    );
  }
}