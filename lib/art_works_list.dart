
import 'dart:convert';
import "package:flutter/material.dart";
import 'package:dio/dio.dart';


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
      Response response = await Dio().get("http://gank.io/api/data/%E7%A6%8F%E5%88%A9/10/1");
      // print(response['images']);
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
      body: ListView.builder(
        itemCount: worksList.length,
        itemExtent: 20.0, //强制高度为50.0

        itemBuilder: (BuildContext context, int index) {
          return Image.network(worksList[index]['url']);
        }
      ),
    );
  }
}