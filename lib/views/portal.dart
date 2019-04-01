import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../model/post.dart';
import '../components/hizhuIcon.dart';

class PortalPageM extends StatefulWidget{
  @override
  _PortalPageState createState() => _PortalPageState();
}

class _PortalPageState extends State<PortalPageM>{
  ScrollController controller = ScrollController();
  bool isShowSearch = false;
  bool isShowSearchPanel = true;
  @override
  void initState(){
    super.initState();
    controller.addListener((){
      int offset = controller.offset.toInt();
      if (offset < 140 && isShowSearch) {
        isShowSearch = false;
        setState(() {

        });
      } else if(offset > 140 && !isShowSearch){
        isShowSearch = true;
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 10.0),
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
        actions: <Widget>[
          Offstage(
            offstage:!isShowSearch,
            child: IconButton(
              icon:Icon(HizhuIcon.search),
              iconSize: 14,
            ),
          ),

        ],
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: isShowSearchPanel ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        controller: controller,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _banner(),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 15,),
          ),
          _stickHeader(),

        ],
      ),
    );
  }


  Widget _stickHeader(){
//    RenderBox renderBox = context.findRenderObject();
//    var size = renderBox.size;
//    var offset = renderBox.localToGlobal(Offset.zero);
    var height = MediaQueryData.fromWindow(window).size.height;
    var width = MediaQueryData.fromWindow(window).size.width;
    var toolbarHeight =  MediaQueryData.fromWindow(window).padding.top;
    var h = height - toolbarHeight - 56 - 44;
    print(height);
    print(width);
    print(h);

    return SliverStickyHeader(
      header: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
//        height: 44,
        child:Column(
          children: <Widget>[
            Container(
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(247, 247, 247, 1))),
//                boxShadow: [BoxShadow(color:Color.fromRGBO(299, 299, 299, 0.08),offset: Offset(0, 1),blurRadius:0)],

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _searchItem('区域',onTap: (){
                    controller.animateTo(290, duration: Duration(milliseconds: 100), curve: Curves.linear);
                    setState(() {
                      isShowSearchPanel = false;
                    });
                  }),
                  _searchItem('租金',onTap: (){

                  }),
                  _searchItem('排序',onTap: (){

                  }),
                  _searchItem('更多',onTap: (){

                  }),
                ],
              ),
            ),
            Offstage(
              offstage: isShowSearchPanel,
              child: Container(
                height: h,
                width: double.infinity,
                color: Colors.white10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Color.fromRGBO(247, 247, 247, 1),
                      height: h,
                      width: 100,
                      child: Container(

                      )
                    ),
                    Container(
                      color: Colors.white,
                      height: h,
                      width: width - 100,
                      child: Text('2'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),

      ),
      sliver: _list(),
    );
  }

  Widget _searchItem(String name,{VoidCallback onTap}){

    return GestureDetector(
      onTap: onTap,
      child: Wrap(
        children: <Widget>[
          Text(name,style: TextStyle(color: Color(0xff8998a0), fontSize: 14.0)),
          Container(
            padding: EdgeInsets.only(top:2, left: 3),
            child: Icon(Icons.arrow_drop_down,color: Color(0xff8998a0), size: 16,),
          ),
        ],
      ),
    );
  }

  Widget _list(){
    return SliverList(
      delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){
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
                                    _tagItem('品牌'),
                                    _tagItem('保障'),
                                    _tagItem('付一压一')
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
          },
          childCount: posts.length
      ),
    );
  }

  Widget _tagItem(String name){
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

  Widget _banner(){
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 160.0,
          child:Image.asset('assets/images/banner.png',fit:BoxFit.cover,),
        ),
        GestureDetector(
            onTap: (){
              print('address click');
            },
            child: Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0,top:140),
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
        )
      ],
    );
  }


}
