
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

class _DocState extends State<Doc> {
  List<GankInfo> list = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }
  void getHttp() async {
    PageList res =  await GankApi.getListData('all', 15, 1);
    setState(() {
      if (res.results.isNotEmpty) list.addAll(res.results);
    });
    // .then((PageList list) {
    //   print(list);
    //   print('++++++++++++++++++++++++++++');
    //   setState(() {
    //     if (list.results.isEmpty) {
    //       // _loadFinish = true;
    //     } else {
    //       list.addAll(list.results);
    //     }
    //   });
    // });
    
    // try {
    //   Response response = await Dio().get(Api().Today);
    //   Map<String, dynamic> data = json.decode(response.toString());
    //   setState(() {
    //     list = data['results']['Android'];
    //   });
    // } catch (e) {
    //   print(e);
    // }
  }
  @override
  Widget build(BuildContext context) {
    return list.length != 0 ? ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return DocItem(item: list[index]);
      },
    ) : Loading();
  }
}