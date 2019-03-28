import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FindRenter extends StatefulWidget {
  @override
  FindRenterState createState() => FindRenterState();
}

class FindRenterState extends State<FindRenter> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('找室友', style: TextStyle(color: Color(0xff4FCBFF), fontSize: 18.0, fontWeight: FontWeight.normal)),
        leading: IconButton(
            icon: Image.asset('assets/images/nav_close.png'),
            onPressed: null
        ),
      ),
      body:Container(
        padding: EdgeInsets.only(top: 42.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 52.0,
                  height: 52.0,
                  margin: EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar2.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 7.0, right: 15.0),
                  height: 48.0,
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/publish_chat_box.png'),
                      Positioned(
                        left: 25.0,
                        top: 14.0,
                        child: Text('张老师发布了一个任务，请接收~', style: TextStyle(fontSize: 14.0, color: Colors.black),),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(6.0, 24.0, 6.0, 30.0),
              child: RoundInnerSquareBox(
                child: Container(
                  padding: EdgeInsets.fromLTRB(24.0, 28.0, 24.0, 12.0),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'unit 1 leasson 3 about animal',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Round',
                          color: Colors.white
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(top:5.0,bottom:13.0),
                        child: new Image.asset('assets/images/publish_work_line.png'),
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          WorkTotalItem(title: '课文跟读 12'),
                          WorkTotalItem(title: '课文跟读 12'),
                          WorkTotalItem(title: '课文跟读 12'),
                          WorkTotalItem(title: '课文跟读 12')
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 178.0),
                        child: Stack(
                          children: <Widget>[
                            Image.asset('assets/images/publish_work_sign.png'),
                            Positioned(
                              left: 4.0,
                              top: 4.0,
                              child: Text(
                                '预习',
                                style: TextStyle(fontSize: 14.0, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          '明天12:00截止',
                          style: TextStyle(fontSize: 12.0,color: Color(0xffffc1c1)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            LineTips(
              title: Text('给家长发个通知吧', style: TextStyle(fontSize: 14.0, color: Color(0xff757085)),),
            ),
            Container(
              margin: EdgeInsets.only(top: 32.0),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 60.0,
                    icon: new Image.asset('assets/images/share_wechat.png'),
                    onPressed: (){
                      print('share to wechat');
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 32.0),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 60.0,
                        icon: Image.asset('assets/images/share_qq.png'),
                        onPressed: (){
                          print('share to qq');
                        }
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      )
    );
  }
}

class RoundInnerSquareBox extends StatelessWidget{
  static const double gap = 12.0;

  RoundInnerSquareBox({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      child: Container(
        color: Color(0xFFF0D5A9),
        padding: EdgeInsets.all(gap),
        child: Container(
          child:Container(
            color: Color(0xFF3C594E),
            child: child,
          )

        ),
      ),
    );
  }
}

class WorkTotalItem extends StatelessWidget {
  WorkTotalItem({
    this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      child: Text(
        "$title",
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.white
        ),
      ),
    );
  }
}

class LineTips extends StatelessWidget{
  static const defaultMargin = EdgeInsets.only(left: 15.0, right: 15.0);

  LineTips({
    @required this.title,
    this.margin = defaultMargin
  });

  final Widget title;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              color: Color(0xffd4cfe4),
              height: 1.0,
            ),
          ),
          title,
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              color: Color(0xffd4cfe4),
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}