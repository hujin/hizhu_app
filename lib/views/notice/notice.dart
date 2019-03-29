import 'package:flutter/material.dart';

double boxsize = 80.0;

class Notice extends StatefulWidget{
  @override
  NoticeState createState() => NoticeState();
}

class NoticeState extends State<Notice>{
  OverlayEntry _overlayEntry;

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
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: <Widget>[
                  FlatButton(
                    child: Text('click'),
                    onPressed: (){
                      this._overlayEntry = this._createOverlayEntry();
                      Overlay.of(context).insert(this._overlayEntry);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  OverlayEntry _createOverlayEntry(){
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    print(offset.dx);
    print(offset.dy);
    print(size.height);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: 0,
        width: size.width,
        child:Container(
            height: 300,
            width: double.infinity,
            color: Colors.yellow,
        ),
      )
    );
  }

}
