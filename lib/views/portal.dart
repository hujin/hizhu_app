import 'package:flutter/material.dart';
import '../components/hizhuIcon.dart';

class Portal extends StatefulWidget{
  @override
  PortalState createState() => PortalState();
}

class PortalState extends State<Portal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('杭州',style: TextStyle(color: Color(0xff2c3236),fontSize: 14.0)),
              Icon(Icons.keyboard_arrow_down,color: Color(0xff66747F),size: 18.0,)
            ],
          ),
        ),
        title: Image.asset('assets/images/blueLogo.png', width: 60.0),
        backgroundColor: Colors.white,
        elevation:0.0,
        centerTitle: true,
      ),
      body:  Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset('assets/images/banner.png',fit:BoxFit.cover),
                InputAddress()
              ],
            ),
            Container(
              margin: EdgeInsets.only(top:18.0, left: 22.5, right: 22.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleMenuButton('assets/images/icon_rent.png','整租'),
                  CircleMenuButton('assets/images/icon_share_rent.png','合租'),
                  CircleMenuButton('assets/images/icon_apartment.png','公寓'),
                  CircleMenuButton('assets/images/icon_house.png','发布房源'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:15.0),
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SearchIem('区域'),
                  SearchIem('租金'),
                  SearchIem('排序'),
                  SearchIem('更多'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15),
              height: 1,
              color: Color(0xffe5e5e5),
            ),
            Container(
              child: Expanded(child: List()),
            )
          ],
        )
      )
    );
  }
}

class InputAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        print('address click');
      },
      child: Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0,top:155),
          height: 44.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color:Colors.white,
              boxShadow: [BoxShadow(color:Color.fromRGBO(0, 0, 0, 0.08),offset: Offset(0, 1),blurRadius:3)],
              borderRadius: BorderRadius.circular(50)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/search.png', width: 22.0,),
              Container(
                margin: EdgeInsets.only(left: 8.0),
                child: Text('请尝试输入想住的地点', style: TextStyle(color:Color(0xffb8c1c7),fontSize: 14.0,fontWeight: FontWeight.w400),),
              )
            ],
          ),
      )
    );
  }
}

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

class SearchIem extends StatelessWidget {
  SearchIem(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      children: <Widget>[
        Text(name,style: TextStyle(color: Color(0xff8998a0), fontSize: 14.0)),
        Container(
          padding: EdgeInsets.only(top:2, left: 3),
          child: Icon(Icons.arrow_drop_down,color: Color(0xff8998a0), size: 16,),
        ),
      ],
    );
  }
}

class List extends StatefulWidget{
  @override
  ListState createState() => ListState();
}

class ListState extends State<List>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index){
        return Container(
          padding: EdgeInsets.only(top:7.5,bottom:7.5),
//          decoration: BoxDecoration(border: Border(bottom:BorderSide(width: 1.0))),
          child: ListTile(
            subtitle: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset('assets/images/list_img.png', width: 120.0,),
                  Expanded(
                    child: Container(
                      height: 112.0,
                      margin: EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 9.5),
                                  height: 24,
                                  child: Text(
                                    '整租·青客红橙黄绿公寓·1居室',
                                    style: TextStyle(color: Color(0xff2c3236), fontSize: 16.0, fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 27,
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('主卧 · 15㎡ · 朝南', style: TextStyle(color: Color(0xff8998a0),fontSize: 12.0),),
                                Row(
                                  children: <Widget>[
                                    Text('2500',style: TextStyle(color: Color(0xffff8e20),fontSize: 18.0)),
                                    Text('元/月',style: TextStyle(color: Color(0xffff8e20),fontSize: 12.0))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top:5.5),
                                height: 18.0,
                                child: Text('距离上海马戏城站200米', style: TextStyle(color: Color(0xff8998a0),fontSize: 12.0),),
                              ),
                            ],
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              children: <Widget>[
                                TagItem('品牌'),
                                TagItem('保障'),
                                TagItem('付一压一')
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class TagItem extends StatelessWidget{
  TagItem(this.name);

  final String name;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 16.0,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(color: Color(0xffefeff4),borderRadius: BorderRadius.circular(4)),
      child: Text(
        name,
        style: TextStyle(color: Color(0xff66747f),fontSize: 10),
      ),
    );
  }
}