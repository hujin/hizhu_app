import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebviewPage extends StatefulWidget{
  String url;
  String title;
  List<Widget> actions;
  Widget leading;

  WebviewPage(this.url,this.title, {Key key,this.leading,this.actions}) : super(key:key);

  @override
  _WebviewPageState createState()=> _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage>{
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {

    return new WebviewScaffold(
      key: scaffoldKey,
      url: widget.url, // 登录的URL
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
        backgroundColor:Color(0xFF57adeb),
        automaticallyImplyLeading:false,
        leading: widget.leading,
        actions: widget.actions,
      ),
      withZoom: true,  // 允许网页缩放
      withLocalStorage: true, // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }
}
