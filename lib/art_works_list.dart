
import 'package:art/art_works_item.dart';
import 'package:art/utils/api.dart';
import "package:flutter/material.dart";
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ArtWorks extends StatefulWidget {
  ArtWorks({Key key}) : super(key: key);
  _ArtWorksState createState() => _ArtWorksState();
}

class _ArtWorksState extends State<ArtWorks> {
  List<dynamic> worksList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      Response response = await Dio().get(Api().Fuli);
      Map<String, dynamic> data = json.decode(response.toString());
      print(data['results']);
      setState(() {
        worksList = data['results'];
      });
    } catch (e) {
      print(e);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.orange,
        child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: worksList.length,
        itemBuilder: (BuildContext context, int index) => ArtWorksItem(item: worksList[index]),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.fit(2),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
      )
    );
  }
}