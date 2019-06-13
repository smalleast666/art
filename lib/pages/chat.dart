import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  WebSocketChannel channel = new IOWebSocketChannel.connect('ws://localhost:8080/ws');
  TextEditingController _controller = new TextEditingController();
  Map<String, dynamic> sendTemp = {"cmd": 6, "username": "client", "email": "963732141@qq.com", "message": ""};
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                Map<String, dynamic> data;
                if (snapshot.hasError) return Text('socket 连接失败');
                else if (snapshot.hasData) data = json.decode(snapshot.data);
                print(data);
                return new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: new Text(snapshot.hasData ? data['message'] : ''),
                );
              },
            ),
            new Form(
              child: new TextFormField(
                controller: _controller,
                decoration: new InputDecoration(labelText: 'Send a message'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: new Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      sendTemp['message'] = _controller.text;
      channel.sink.add(json.encode(sendTemp));
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}