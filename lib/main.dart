import 'package:flutter/material.dart';
import './views/portal.dart';
import './views/findRenter.dart';
import './views/notice.dart';
import './views/mine.dart';
import './components/hizhuIcon.dart';
import './views/home/home.dart';
import './views/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => HomePage(),
        '/login': (context) => Login(),
      },
//      home: MyHomePage(title: 'haizhu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState(){
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Portal(),
          FindRenter(),
          Notice(),
          Mine()
        ]
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        shape: Border(top:BorderSide(color:Color(0xffE5E5E5))),
        child: TabBar(
          indicatorColor:Colors.white,
//          indicator: new ShapeDecoration(shape: new Border.all(color: Colors.white, width: 1.0)),
          labelColor: Color(0xff4FCBFF),
          unselectedLabelColor: Color(0xff8998A0),
          labelStyle: TextStyle(fontWeight: FontWeight.normal),
          controller: controller,
          tabs: <Tab>[
            Tab(text: '首页', icon: Icon(HizhuIcon.portal)),
            Tab(text: '找室友', icon: Icon(HizhuIcon.find_renter)),
            Tab(text: '消息', icon: Icon(HizhuIcon.notice)),
            Tab(text: '我的', icon: Icon(HizhuIcon.mine))
          ]
        ),
      ),
    );
  }
}
