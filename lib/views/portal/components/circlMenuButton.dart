import 'package:flutter/material.dart';


class CircleMenuButton extends StatelessWidget{
  CircleMenuButton(this.imgUrl, this.name);

  final String imgUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        print("$name click");
      },
      child: Column(
        children: <Widget>[
          Image.asset(imgUrl, width: 50,),
          Container(
            margin: EdgeInsets.only(top:10.0),
            child:Text(name, style: TextStyle(fontSize: 13.0, color: Color(0xff2c3236)),),
          ),
        ],
      ),
    );
  }
}