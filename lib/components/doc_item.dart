
import 'package:art/components/webview.dart';
import "package:flutter/material.dart";

class DocItem extends StatefulWidget {
  DocItem({Key key, this.item}) : super(key: key);
  final item;
  _DocState createState() => _DocState();
}

class _DocState extends State<DocItem> {
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebView(url: widget.item.url);
        }));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 15, right: 15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2.0),
              blurRadius: 4
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                widget.item.desc,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                    Text(
                      widget.item.who,
                      style: TextStyle(
                        color: Colors.black54
                      ),  
                    ),
                    Text(
                      ' — ${widget.item.type}',
                      style: TextStyle(
                        color: Colors.black54
                      ),  
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.query_builder,
                      color: Colors.black54
                    ),
                    Text(widget.item.createdAt.substring(0, 10)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
