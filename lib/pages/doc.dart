
import 'package:art/components/doc_item.dart';
import 'package:art/components/loading.dart';
import 'package:art/models/GankInfo.dart';
import 'package:art/models/PageList.dart';
import 'package:flutter/material.dart';
import 'package:art/api/api_gank.dart';

class Doc extends StatefulWidget {
  Doc({Key key}) : super(key: key);

  _DocState createState() => _DocState();
}

class _DocState extends State<Doc> with SingleTickerProviderStateMixin {
  List<GankInfo> list = List();
  TabController _controller;
  List<String> _tabs = <String>[
    '全部',
    'Android',
    'iOS',
    '前端',
    '休息视频',
    '拓展资源',
    '瞎推荐',
    'App'
  ];
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _tabs.length);
    getHttp();
  }
  void getHttp() async {
    PageList res =  await GankApi.getListData('all', 15, 1);
    setState(() {
      if (res.results.isNotEmpty) list.addAll(res.results);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: _tabs.map((String tab) => Tab(text: tab)).toList(),
        ),
      ),
      body: list.length != 0 ? ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return DocItem(item: list[index]);
        },
      ) : Loading(),
    );
  }
}