import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:fake_tencent/fake_tencent.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/util/TransationUtil.dart';
import 'package:like_this/widget/login_social_button.dart';

import 'login.dart';

class ThirdSocialLoginPage extends StatefulWidget {
  @override
  ThirdSocialLoginState createState() => new ThirdSocialLoginState();
}

class ThirdSocialLoginState extends State<ThirdSocialLoginPage> {
  ScreenUtils screenUtil = new ScreenUtils();
  Tencent _tencent = Tencent()..registerApp(appId: '1109831276');
  StreamSubscription<TencentLoginResp> _login;
  StreamSubscription<TencentUserInfoResp> _userInfo;
  TencentLoginResp _loginResp;

  String _result = "无";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadJson();
    _login = _tencent.loginResp().listen(_listenLogin);
    _userInfo = _tencent.userInfoResp().listen(_listenUserInfo);
    fluwx.register(
        appId: "wxbdb66154033d3505", doOnAndroid: true, doOnIOS: true);
  }

  void _listenLogin(TencentLoginResp resp) {
    _loginResp = resp;
    String content = 'login: ${resp.openid} - ${resp.accessToken}';
    _showTips('登录', content);
  }

  String code = "";
  String dataStr = "";

//微信登录
  _loginWeChat() async {
    fluwx.sendAuth(scope: "snsapi_userinfo", state: "wechat_sdk_demo_test");
    var respCode = "";
    fluwx.responseFromAuth.listen((response) {
      setState(() {
        code = 'response:' + response.code;
        respCode = response.code;
        _getAccessToken(respCode);
      });
    });
  }

  //获取act
  _getAccessToken(respCode) async {
//    var res = await UserDao.wxOauth(respCode);
//    setState(() {
//      if(res.data['Code'].toString()=='0'){
//        //跳转到我的
//        Navigator.pushNamed(context, '/myinfo');
//      }else{
//        //手机认证，跳转到手机认证
////        Navigator.of(context).push( new MaterialPageRoute(builder: (context)=> new MobilePage(token: res.data['Data']) ));
//      }
//    });
  }

  void _showTips(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      },
    );
  }

  void _listenUserInfo(TencentUserInfoResp resp) {
    String content = 'user info: ${resp.nickname} - ${resp.gender}';
    _showTips('用户', content);
  }

  @override
  void dispose() {
    if (_login != null) {
      _login.cancel();
    }
    if (_userInfo != null) {
      _userInfo.cancel();
    }
    _result = null;
    super.dispose();
  }

  List<PickerItem> list = new List();

  // ignore: non_constant_identifier_names
  List<String> countryList = new List();

  void loadJson() {
    rootBundle.loadString('assert/json/country_code_json.json').then((value) {
      var encode = json.decode(value);
      for (int i = 0; i < encode.length; i++) {
        countryList.add(encode[i]['country']);
        list.add(new PickerItem(
            text: new Text(encode[i]['country']), value: encode[i]['code']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    screenUtil.initUtil(context);
    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.white,
          alignment: Alignment.centerLeft,
          child: new Column(
            children: <Widget>[
              new Text("登录",
                  style: new TextStyle(
                      decoration: TextDecoration.none,
                      color: Color(0xff000000),
                      fontSize: screenUtil.setWidgetWidth(29),
                      fontWeight: FontWeight.bold)),
              new Container(
                child: new Text("社交账号快速登录",
                    style: new TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: screenUtil.setWidgetWidth(14),
                        color: Color(0xffb6b6b6))),
                padding: EdgeInsets.only(
                    top: screenUtil.setWidgetWidth(10),
                    bottom: screenUtil.setWidgetWidth(30)),
              ),
              new Container(
                padding: EdgeInsets.only(top: screenUtil.setWidgetHeight(28)),
                child: new LoginSocialButton(
                  icoPath: "assert/imgs/login_qq.png",
                  title: "QQ登录",
                  bgColor: Color(0xff2fc2ff),
                  onClickCallBack: () {
                    _tencent.login(
                      scope: [TencentScope.GET_SIMPLE_USERINFO],
                    );
                  },
                ),
              ),
              new LoginSocialButton(
                icoPath: "assert/imgs/login_wechat.png",
                title: "微信登录",
                bgColor: Color(0xff52bd33),
                onClickCallBack: () {
                  _loginWeChat();
                },
              ),
              new Container(
                child: new Expanded(
                    child: new GestureDetector(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "使用手机号码登录或注册",
                        style: new TextStyle(
                            fontSize: screenUtil.setFontSize(15),
                            decoration: TextDecoration.none,
                            color: Color(0xff576189),
                            fontWeight: FontWeight.normal),
                      ),
                      new Image.asset(
                        "assert/imgs/login_arrow_rightx.png",
                        width: screenUtil.setWidgetWidth(17),
                        height: screenUtil.setWidgetHeight(13),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context,
                        new CustomRouteSlide(new LoginPage()), (route) => route == null
                    );
                  },
                )),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          padding: EdgeInsets.only(
              left: screenUtil.setWidgetWidth(20),
              right: screenUtil.setWidgetWidth(20),
              top: screenUtil.setWidgetWidth(60)),
        ),
        new Container(
          alignment: Alignment.topRight,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
              top: screenUtil.setWidgetHeight(70),
              right: screenUtil.setWidgetWidth(20)),
          height: screenUtil.setWidgetHeight(38),
          child: GestureDetector(child:new Image.asset(
            "assert/imgs/closex.png",
            width: screenUtil.setWidgetWidth(20),
            height: screenUtil.setWidgetHeight(20),
          ) ,onTap: (){
            Navigator.pushAndRemoveUntil(context,
                new CustomRouteSlide(new LoginPage()), (route) => route == null
            );
          },),
        )
      ],
    );
  }
}
