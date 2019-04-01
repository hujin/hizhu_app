import 'package:flutter/material.dart';

class Mine extends StatefulWidget{
  @override
  MineState createState() => MineState();
}

class MineState extends State<Mine>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        child: FlatButton(
            onPressed: (){
              Navigator.pushNamed(context, '/login');
            },
            child: Text('login')
        ),
      ),
    );
  }
}

