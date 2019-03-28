import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import './components/loginAppBar.dart';
import '../webview/webview.dart';
import 'dart:async';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  final loginFormKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _labelTextStyle = TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.normal);
  final _hintStyle = TextStyle(color: Colors.white54);
  final _richTextStyle = TextStyle(color: Colors.white70, fontSize: 14);

  int _seconds = 0;
  Timer _timer;
  String _verifyText = '获取验证码';
  String phone,verifyCode;

  void _startTimer(){
    if (_seconds != 0) {
      return;
    }
    _seconds = 60;

    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      if (_seconds == 0) {
        _cancelTimer();
        return;
      }
      _seconds--;
      _verifyText = '已发送($_seconds)';

      setState(() {
      });
      if (_seconds == 0) {
        _verifyText = '获取验证码';
      }
    });
  }

  void _cancelTimer(){
    _timer?.cancel();
  }

  @override
  void dispose(){
    super.dispose();
    _cancelTimer();
  }

  void _submitVerify(){
    loginFormKey.currentState.save();
    if(phone.isEmpty || phone.length < 11){
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text('请输入11位正确的电话号码！'))
      );
      return;
    }
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('已发送！'))
    );
    _startTimer();
  }

  void _submitLogin(){
    loginFormKey.currentState.save();
    if(phone.isEmpty || phone.length < 11){
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text('请输入11位正确的电话号码！'))
      );
      return;
    }

    if(verifyCode.isEmpty){
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('请输入短信验证码!'))
      );
      return;
    }

    if(verifyCode != '032794'){
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text('短信验证码不正确!'))
      );
      return;
    }

    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('登录成功!'))
    );

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          child: Column(
            children: <Widget>[
              LoginAppBar(),
              Image.asset('assets/images/loginLogo.png', height: 105,),
              SizedBox(height: 60,),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(bottom:BorderSide(color: Colors.white))
                        ),
                        child: Stack(
                          children: <Widget>[
                            TextFormField(
                              maxLines: 1,
                              keyboardType: TextInputType.phone,
                              inputFormatters:[
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                icon: Container(child:Text('手机号', style: _labelTextStyle),width: 65,),
                                hintText: '请输入手机号',
                                hintStyle: _hintStyle,
                                border:InputBorder.none,
                              ),
                              onSaved: (value) {
                                phone = value;
                              },
                              style: TextStyle(color: Colors.white),
                            ),
                            Positioned(
                              right: 1,
                              child: Container(
                                width: 110,
                                child: OutlineButton(
                                  child: Text(_verifyText, style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                                  shape: StadiumBorder(),
                                  borderSide: BorderSide(color: Colors.white),
                                  onPressed: _submitVerify,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 6,),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(bottom:BorderSide(color: Colors.white))
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              icon: Container(child:Text('短信验证', style: _labelTextStyle,), width: 65,),
                              border: InputBorder.none,
                              hintText: '请输入短信验证码',
                              hintStyle: _hintStyle
                          ),
                          style: TextStyle(color: Colors.white),
                          onSaved: (value){
                            verifyCode = value;
                          },
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width: double.infinity,
                        height: 44,
                        child: RaisedButton(
                          child: Text('登录', style: TextStyle(color:Colors.white,fontSize: 17,letterSpacing: 2),),
                          onPressed: _submitLogin,
                          color: Color(0xff9fdafc),
                          shape: StadiumBorder(),
                          elevation: 0,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        child: Text.rich(
                            TextSpan(
                                text: '登录即表示同意',
                                style: _richTextStyle,
                                children: [
                                  TextSpan(
                                      text: '《嗨住平台用户协议》',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(context, MaterialPageRoute(
                                            builder: (BuildContext context) => WebviewPage(
                                              'https://ml.hizhu.com/app/index.php?device=iphone&temp=terms',
                                              '嗨住平台用户协议',
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('关闭', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),),
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                  },
                                                )
                                              ],
                                            ),
                                            fullscreenDialog: true
                                          ));
                                        }
                                  )
                                ]
                            )
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFABE6FF),
                Color(0xFF31B3F9)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      )
    );
  }
}