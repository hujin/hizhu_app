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
      body: Center(
        child: Text('mine'),
      ),
    );
  }
}

