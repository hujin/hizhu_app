import 'package:flutter/material.dart';
import 'dart:ui';

class Portal extends StatefulWidget{
  @override
  PortalState createState() => PortalState();
}

class PortalState extends State<Portal> {
  OverlayEntry _overlayEntry;
  bool isShowPanel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Image.asset('assets/images/blueLogo.png', width: 60.0),
        backgroundColor: Colors.white,
        elevation:0.0,
        centerTitle: true,
      ),
      body:Container(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('click me'),
              onPressed: (){
                if (!isShowPanel) {
                  isShowPanel = true;
                  setState(() {

                  });
                  this._overlayEntry = this._createOverlayEntry();
                  Overlay.of(context).insert(this._overlayEntry);
                }else{
                  isShowPanel = false;
                  setState(() {
                    this._overlayEntry.remove();
                  });
                }

              },
            )
          ],
        ),
      )
    );
  }


  OverlayEntry _createOverlayEntry(){
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    var toolbarHeight =  MediaQueryData.fromWindow(window).padding.top;
    var h = size.height - toolbarHeight - 56 - 44;

    return OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: toolbarHeight + 56 + 44,
          width: size.width,
          child:Container(
            height: h,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
        )
    );
  }

}

