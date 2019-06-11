import 'package:art/components/my_drawer.dart';
import 'package:art/pages/doc.dart';
import 'package:art/pages/ourLove.dart';
import 'package:art/pages/timing.dart';
import 'package:art/pages/upLoad.dart';
import 'package:art/pages/art_works_list.dart';

import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key key}) : super(key: key);

  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;
  double _elevation = 4;
  List<Widget> list = List();
  final pages = [OurLove(), ArtWorks(), Doc(), UpLoad(), Timing()];
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      title: Text('OurLove')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.photo),
      title: Text('Works'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.library_books),
      title: Text('doc')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_to_photos),
      title: Text('UpLoad')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.timeline),
      title: Text('Timing')
    ),
  ];
  final List<String> appBarTitle= ['our love', 'art works', 'Doc', 'up load picture', 'Timing'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle[_currentIndex]),
        elevation: _elevation, // title 阴影
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          if (index != _currentIndex) {
            setState(() {
              if (appBarTitle[index] == 'Doc') _elevation = 1;
              else _elevation = 4;
              _currentIndex = index;
            });
          }
        },
      ),
      body: pages[_currentIndex],
    );
  }

}
