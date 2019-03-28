import 'package:flutter/material.dart';
import './portal.dart';

double boxsize = 80.0;

class Notice extends StatefulWidget{
  @override
  NoticeState createState() => NoticeState();
}

class NoticeState extends State<Notice>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('notice'),
            floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title:Text(
                "notice".toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400
                ),
              ),
              background: Image.asset('assets/images/banner.png', fit: BoxFit.cover,),
            ),
          )
        ],
      ),
    );
  }
  
 
}
