import 'package:flutter/material.dart';

import '../portal/portal.dart';
import '../findRenter.dart';
import '../notice.dart';
import '../mine.dart';
import '../../components/hizhuIcon.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  int _currentIndex = 0;
  List<Map> list = [
    {'name':'首页','icon': Icon(HizhuIcon.portal)},
    {'name':'找室友','icon': Icon(HizhuIcon.find_renter)},
    {'name':'消息','icon': Icon(HizhuIcon.notice)},
    {'name':'我的','icon': Icon(HizhuIcon.mine)},
  ];

  List _pageList = [
    PortalPage(),
    FindRenter(),
    Notice(),
    Mine()
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index){
          _currentIndex = index;
          setState(() {

          });
        },
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color(0xff8998A0),
        fixedColor: Color(0xff4FCBFF),
        selectedFontSize: 12.0,
        items: list.map((item){
          return BottomNavigationBarItem(
            icon:item['icon'],
            title: Text(item['name']),
          );
        }).toList(),
      ),
    );
  }
}