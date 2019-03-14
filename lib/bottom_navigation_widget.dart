import 'package:flutter/material.dart';
import 'pages/sail_screen.dart';
import 'pages/home_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  //生命周期
  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(SailScreen());
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();

    // Additional code
  }

  @override
  void dispose(){
    // Additional disposal code

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_identity,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.trending_up,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '销量',
                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
