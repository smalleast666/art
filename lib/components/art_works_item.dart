
import 'package:art/pages/full_screen_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:loading_indicator/loading_indicator.dart';

class ArtWorksItem extends StatefulWidget {
  ArtWorksItem({Key key, this.item}) : super(key: key);
  final item;
  _ArtWorksState createState() => _ArtWorksState();
}

class _ArtWorksState extends State<ArtWorksItem> {
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FullScreenImagePage(widget.item['url']);
        }));
      },
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: widget.item['url'],
            placeholder: (context, url) => Padding(
              padding: EdgeInsets.all(40),
              child: LoadingIndicator(indicatorType: Indicator.orbit),
            ),
            errorWidget:  (context, url, error) => Center(
              child: Image.asset('lib/assets/fail.png'),
            ),
          ),
          Text(widget.item['who']),
        ],
      ),
    );
  }
}
