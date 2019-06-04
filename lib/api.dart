

import 'package:dio/dio.dart';

void getHttp() async {
  try {
    Response response = await Dio().get("https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=20");
    print(response);
  } catch (e) {
    print(e);
  }
}