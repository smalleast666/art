
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
    print(widget.item);
    print('++++++');
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebView(url: widget.item['url']);
        }));
        // Navigator.of(context).pushNamed('webview');
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Text(widget.item.desc),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person),
                      Text(widget.item.who),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.query_builder),
                      Text(widget.item.createdAt),
                    ],
                  ),
                )
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
