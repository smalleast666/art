
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class Timing extends StatefulWidget {
  Timing({Key key}) : super(key: key);

  _TimingState createState() => _TimingState();
}

class _TimingState extends State<Timing> {

  List<TimelineModel> items = [
      TimelineModel(Text('asdasd'),
          position: TimelineItemPosition.random,
          iconBackground: Colors.green,
          icon: Icon(Icons.blur_circular, color: Colors.white)),
      TimelineModel(Placeholder(),
          position: TimelineItemPosition.random,
          iconBackground: Colors.deepPurple,
          icon: Icon(Icons.location_city, color: Colors.white)),
    ];

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Timeline(children: items, position: TimelinePosition.Center),
    );
  }
}