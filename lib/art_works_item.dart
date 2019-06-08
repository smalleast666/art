
import "package:flutter/material.dart";

class ArtWorksItem extends StatefulWidget {
  ArtWorksItem({Key key, this.item}) : super(key: key);
  final item;
  _ArtWorksState createState() => _ArtWorksState();
}

class _ArtWorksState extends State<ArtWorksItem> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Image.network(widget.item['url']),
      ),
    );
  }
}
