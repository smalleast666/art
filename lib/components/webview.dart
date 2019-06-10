
import 'package:art/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget {
  WebView({Key key, this.url}) : super(key: key);
  final url;

  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      initialChild: Loading(),
    );
  }
}