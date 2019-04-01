import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
          height: 64,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 6,
                child: IconButton(
                  icon:Icon(Icons.arrow_back_ios,color: Colors.white),
                  onPressed: (){
                        Navigator.pop(context);
                  },
                ),
              ),

              Container(
                height: 64,
                width:  double.infinity,
                alignment: Alignment.center,
                child: Text('登录', style: TextStyle(fontSize: 18, color: Colors.white),),
              )
            ],
          )
      ),
    );
  }
}