import 'dart:async';
import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:like_this/login/third_social_login.dart';
import 'package:like_this/login/user_register_owner_information.dart';

import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/util/TransationUtil.dart';

import 'package:like_this/widget/input_text_fied.dart';

final TextStyle _availableStyle = TextStyle(
    color: const Color(0xFF2da689),
    decoration: TextDecoration.none,
    fontSize: 14,
    fontWeight: FontWeight.normal);

final TextStyle _unavailableStyle = TextStyle(
    fontSize: 16.0,
    color: const Color(0xFFCCCCCC),
    decoration: TextDecoration.none,
    fontWeight: FontWeight.normal);

class LoginPage extends StatefulWidget {
  /// 倒计时的秒数，默认60秒。
  final int countdown;

  /// 用户点击时的回调函数。
  final Function onTapCallback;

  /// 是否可以获取验证码，默认为`false`。
  final bool available;

  LoginPage({
    this.countdown: 60,
    this.onTapCallback,
    this.available: true,
  });

  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<LoginPage> {
  ScreenUtils screenUtil = new ScreenUtils();
  Timer _timer;
  String countryCode = "+（86）中国大陆";

  /// 当前倒计时的秒数。
  int _seconds;

  /// 当前墨水瓶（`InkWell`）的字体样式。
  TextStyle inkWellStyle = _availableStyle;

  /// 当前墨水瓶（`InkWell`）的文本。
  String _verifyStr = '获取验证码';

  /// 启动倒计时的计时器。
  void _startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        _seconds = widget.countdown;
        inkWellStyle = _availableStyle;
        setState(() {});
        return;
      }
      _seconds--;
      _verifyStr = '已发送$_seconds' + 's';
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = '重新发送';
      }
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seconds = widget.countdown;
    loadJson();
  }

  List<PickerItem> list = new List();

  String telPhone = '';
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
                child: new Text("手机号注册或登录",
                    style: new TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: screenUtil.setWidgetWidth(14),
                        color: Color(0xffb6b6b6))),
                padding: EdgeInsets.only(
                    top: screenUtil.setWidgetWidth(10),
                    bottom: screenUtil.setWidgetWidth(30)),
              ),
              new GestureDetector(
                  child: new Container(
                    height: screenUtil.setWidgetHeight(55),
                    color: Color(0xfff8f8f8),
                    child: new ListTile(
                      title: new Text(countryCode,
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: screenUtil.setFontSize(15))),
                      trailing: new Image.asset(
                        "assert/imgs/arrow_down_refund.png",
                        width: screenUtil.setWidgetHeight(16),
                        height: screenUtil.setWidgetHeight(16),
                      ),
                    ),
                  ),
                  onTap: () async {
                    Picker picker = new Picker(
                        textStyle: new TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: screenUtil.setFontSize(12)),
                        itemExtent: screenUtil.setWidgetHeight(31),
                        adapter: PickerDataAdapter(
                          data: list,
                        ),
                        height: screenUtil.setWidgetHeight(210),
                        changeToFirst: true,
                        cancelText: "取消",
                        confirmText: "确定",
                        cancelTextStyle: new TextStyle(
                            color: Color(0xffbfbfbf),
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        confirmTextStyle: new TextStyle(
                            color: Color(0xff19bebf),
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                        columnPadding: const EdgeInsets.all(30.0),
                        onConfirm: (Picker picker, List value) {
                          this.setState(() {
                            countryCode = countryList[value[0]];
                          });
                        });
                    picker.showModal(context);
                  }),
              new Container(
                color: Color(0xfff8f8f8),
                alignment: Alignment.center,
                height: screenUtil.setWidgetHeight(55),
                margin: EdgeInsets.only(top: screenUtil.setWidgetHeight(16)),
                child: new ITextField(
                    contentHeight: screenUtil.setWidgetHeight(15),
                    keyboardType: ITextInputType.number,
                    hintText: '请输入手机号',
                    deleteIcon: new Image.asset(
                      "assert/imgs/icon_image_delete.png",
                      width: screenUtil.setWidgetWidth(18),
                      height: screenUtil.setWidgetHeight(55),
                    ),
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: screenUtil.setFontSize(15)),
                    inputBorder: InputBorder.none,
                    fieldCallBack: (content) {
                      telPhone = content;
//                print(_phoneNumber);
                    }),
              ),
              new Container(
                  height: screenUtil.setWidgetHeight(55),
                  color: Color(0xfff8f8f8),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: screenUtil.setWidgetHeight(16)),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        child: new TextField(
                          maxLength: 6,
                          style: new TextStyle(
                              fontSize: screenUtil.setFontSize(15)),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              counterText: "",
                              hintText: '验证码',
                              border: new UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              )),
                        ),
                        width: screenUtil.setWidgetHeight(150),
                        margin: EdgeInsets.only(
                            left: screenUtil.setWidgetWidth(18)),
                      ),
                      new Expanded(
                          child: new Container(
                        alignment: Alignment.centerRight,
                        child: widget.available
                            ? InkWell(
                                child: Text(
                                  '  $_verifyStr  ',
                                  style: inkWellStyle,
                                ),
                                onTap: (_seconds == widget.countdown)
                                    ? () {
                                        _startTimer();
                                        inkWellStyle = _unavailableStyle;
                                        _verifyStr = '已发送$_seconds' + 's';
                                        setState(() {});
                                        widget.onTapCallback();
                                      }
                                    : null,
                              )
                            : InkWell(
                                child: Text(
                                  '  获取验证码  ',
                                  style: _unavailableStyle,
                                ),
                              ),
                      ))
                    ],
                  )),
              new Container(
                width: MediaQuery.of(context).size.width,
                height: screenUtil.setWidgetHeight(50),
                margin: EdgeInsets.only(top: screenUtil.setWidgetHeight(16)),
                child: new MaterialButton(
                  color: Color(0xff7c7f88),
                  textColor: Colors.white,
                  child: new Text(
                    '登陆',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        new CustomRouteSlide(new UserRegisterInformationPage()),
                            (route) => route == null);
                  },
                ),
              ),
              new Container(
                margin: EdgeInsets.only(top: screenUtil.setWidgetHeight(16)),
                child: RichText(
                  text: TextSpan(
                    text: '点“登录”按钮,即表明您已阅读并同意',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: '《用户注册协议》',
                          style: TextStyle(
                              color: Color(0xff576189), fontSize: 15.0),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {}),
                      TextSpan(
                        text: '和 ',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      TextSpan(
                          text: '《隐私权政策》 ',
                          style: TextStyle(
                              color: Color(0xff576189), fontSize: 15.0),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {})
                    ],
                  ),
                ),
              ),
              new Container(
                child: new Expanded(
                    child: GestureDetector(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "社交账号快速登录",
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
                    Navigator.push(
                        context, CustomRouteSlide(ThirdSocialLoginPage()));
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
          child: GestureDetector(
            child: new Image.asset(
              "assert/imgs/closex.png",
              width: screenUtil.setWidgetWidth(20),
              height: screenUtil.setWidgetHeight(20),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  new CustomRouteSlide(new ThirdSocialLoginPage()),
                  (route) => route == null);
            },
          ),
        )
      ],
    );
  }
}
