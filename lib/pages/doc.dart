
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: _tabs.map((String tab) => Tab(text: tab)).toList(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: TabBarView(
          controller: _controller,
          children: _tabs.map<Widget>((String tab) {
            if (tab == '全部') return new TabView(type: "all");
            return new TabView(type: tab);
          }).toList()
        ),
      ),
    );
  }
}



class TabView extends StatefulWidget {
  TabView({Key key, this.type}) : super(key: key);
  final type;
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {

  List<GankInfo> list = List();
  ScrollController _scrollController = new ScrollController();
  int _page = 1;
  bool isPerformingRequest = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        setState(() => _page++);
        getHttp();
      }
    });
    getHttp();
  }
  void getHttp() async {
    setState(() {
      isPerformingRequest = true;
    });
    PageList res = await GankApi.getListData(widget.type, 20, _page);
    if (mounted) setState(() {
      if (res.results.isNotEmpty) list.addAll(res.results);
      isPerformingRequest = false;
    });
  }

  Future _refresh() async {
    list.clear();
    getHttp();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return list.length != 0 ? RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        itemCount: list.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == list.length) return Loading();
          else return DocItem(item: list[index]);
        },
        controller: _scrollController,
      ),
    ) : Loading();
  }
}