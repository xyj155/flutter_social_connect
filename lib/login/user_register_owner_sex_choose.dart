import 'package:flutter/material.dart';
import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/widget/input_text_fied.dart';


class UserRegisterInformationPage extends StatefulWidget {
  @override
  _UserRegisterInformationPageState createState() =>
      _UserRegisterInformationPageState();
}

class _UserRegisterInformationPageState
    extends State<UserRegisterInformationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  ScreenUtils screenUtil = new ScreenUtils();
  @override
  Widget build(BuildContext context) {
    screenUtil.initUtil(context);
    return new Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: new Column(
        children: <Widget>[
          new Text("基本信息",
              style: new TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xff000000),
                  fontSize: screenUtil.setWidgetWidth(29),
                  fontWeight: FontWeight.bold)),
          new Container(
            child: new Text("填写你的基本信息，让周围的人更想认识你",
                style: new TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: screenUtil.setWidgetWidth(14),
                    color: Color(0xffb6b6b6))),
            padding: EdgeInsets.only(
                top: screenUtil.setWidgetWidth(10),
                bottom: screenUtil.setWidgetWidth(30)),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            height: screenUtil.setWidgetHeight(50),
            margin: EdgeInsets.only(top: screenUtil.setWidgetHeight(16)),
            child: new MaterialButton(
              color: Color(0xff7c7f88),
              textColor: Colors.white,
              child: new Text(
                '确认',
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
//                Navigator.pushAndRemoveUntil(context,
//                    new CustomRouteSlide(new UserRegisterInformationPage()),
//                        (route) => route == null);
              },
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      padding: EdgeInsets.only(
          left: screenUtil.setWidgetWidth(20),
          right: screenUtil.setWidgetWidth(20),
          top: screenUtil.setWidgetWidth(50)),
    );
  }
}
