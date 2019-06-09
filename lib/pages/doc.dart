import 'package:flutter/material.dart';

class Doc extends StatefulWidget {
  Doc({Key key}) : super(key: key);

  _DocState createState() => _DocState();
}

class _DocState extends State<Doc> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Doc'),
    );
  }
}