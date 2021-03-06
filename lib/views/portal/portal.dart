import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../../model/post.dart';
import './components/circlMenuButton.dart';
import '../../components/hizhuIcon.dart';

class PortalPage extends StatefulWidget{
  @override
  _PortalPageState createState() => _PortalPageState();
}

class _PortalPageState extends State<PortalPage>{
  ScrollController controller = ScrollController();
  bool isShowSearch = false;
  bool isShowSearchPanel = true;

  List firstList = ['不限', '附近', '商圈', '地铁'];
  List nearbyList = ['500米', '1千米', '2千米', '3千米'];
  List businessList = ['滨江', '淳安', '富阳', '拱墅', '建德', '江干', '临安', '上城', '桐庐', '下城', '西湖', '下沙', '萧山', '余杭'];
  List areaList = [Container()];
  int firstCurrent = 0, businessCurrent = 0;


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

    areaList.add(_nearby(nearbyList));
    areaList.add(_business());
    areaList.add(Container(child: Text('地铁'),));
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
            child: Container(
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
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15,),
          ),
          _stickHeader(),

        ],
      ),
    );
  }

  Widget _nearby(List list){
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index){
        return GestureDetector(
          onTap: (){
            print(list[index]);
          },
          child: Container(
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(247, 247, 247, 1))),
            ),
            height: 40,
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: Text(list[index]),
          ),
        );
      },
    );
  }

  Widget _business(){
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          child: _businessList(businessList),
          color: Color.fromRGBO(250, 250, 250, 1),
        )
      ],
    );
  }

  Widget _businessList(List list){
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index){
        return GestureDetector(
          onTap: (){
            setState(() {
              businessCurrent = index;
            });
          },
          child: Container(
            padding: EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 40,
            child: Text(
              list[index],
              style: TextStyle(color: (businessCurrent == index) ? Color(0xff4FCBFF) : Colors.black),
            ),
            color: (businessCurrent == index) ? Colors.white : Colors.transparent,
          ),
        );
      },
    );
  }

  Widget _stickHeader(){
    var height = MediaQueryData.fromWindow(window).size.height;
    var width = MediaQueryData.fromWindow(window).size.width;
    var toolbarHeight =  MediaQueryData.fromWindow(window).padding.top;
    var h = height - toolbarHeight - 56 - 44;

    return SliverStickyHeader(
      header: Container(
        decoration: BoxDecoration(
          color: Colors.white,
//          boxShadow: [BoxShadow(color:Color.fromRGBO(299, 299, 299, 0.08),offset: Offset(0, 1),blurRadius:1)],
        ),
//        height: 44,
        child:Column(
          children: <Widget>[
            Container(
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(247, 247, 247, 1))),
//              boxShadow: [BoxShadow(color:Color.fromRGBO(299, 299, 299, 0.08),offset: Offset(0, 1),blurRadius:0)],
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
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index){
                            return GestureDetector(
                              onTap: (){
                                if(index == 0){
                                  isShowSearchPanel = true;
                                }
                                setState(() {
                                  firstCurrent = index;
                                });
                                print(firstCurrent);
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 15),
                                height: 40,
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  firstList[index],
                                  style: TextStyle(color: (firstCurrent == index && firstCurrent != 0) ? Color(0xff4FCBFF) : Colors.black),
                                ),
                                color: (firstCurrent == index && firstCurrent != 0) ? Colors.white : Colors.transparent,
                              ),
                            );
                          },
                        )
                    ),
                    Container(
                      color: Colors.white,
                      height: h,
                      width: width - 100,
                      child: areaList[firstCurrent],
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
