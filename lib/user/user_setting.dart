import 'package:flutter/material.dart';
import 'package:like_this/util/CommonBack.dart';
import 'package:like_this/util/ScreenUtils.dart';

class UserSettingPageIndex extends StatefulWidget {
  @override
  _UserSettingPageIndexState createState() => _UserSettingPageIndexState();
}

class _UserSettingPageIndexState extends State<UserSettingPageIndex>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ScreenUtils screenUtils = new ScreenUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackUtil.NavigationBack(context, "设置"),
        body:new Container(
          color: Colors.white,
          child:  new Column(
            children: <Widget>[
              new ListTile(
                title: new Text(
                  "消息通知",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                trailing: new Image.asset(
                  "assert/imgs/person_arrow_right_grayx.png",
                  height: 15,
                  width: 15,
                ),
              ),
              new ListTile(
                title: new Text(
                  "隐私设置",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                trailing: new Image.asset(
                  "assert/imgs/person_arrow_right_grayx.png",
                  height: 15,
                  width: 15,
                ),
              ),
              new ListTile(
                title: new Text(
                  "账号与安全",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                trailing: new Image.asset(
                  "assert/imgs/person_arrow_right_grayx.png",
                  height: 15,
                  width: 15,
                ),
              ),
              new Container(height:screenUtils.setWidgetHeight(10),
                color: Color(0xfffafafa),),
              new ListTile(
                title: new Text(
                  "我要打分",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                trailing: new Image.asset(
                  "assert/imgs/person_arrow_right_grayx.png",
                  height: 15,
                  width: 15,
                ),
              ),
              new Container(height:screenUtils.setWidgetHeight(10),
                color: Color(0xfffafafa),),
              new ListTile(
                title: new Text(
                  "用户隐私及协议说明",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                trailing: new Image.asset(
                  "assert/imgs/person_arrow_right_grayx.png",
                  height: 15,
                  width: 15,
                ),
              ),
              new ListTile(
                title: new Text(
                  "帮助和反馈",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                trailing: new Image.asset(
                  "assert/imgs/person_arrow_right_grayx.png",
                  height: 15,
                  width: 15,
                ),
              ),
              new ListTile(
                title: new Text(
                  "当前版本",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                trailing: new Image.asset(
                  "assert/imgs/person_arrow_right_grayx.png",
                  height: 15,
                  width: 15,
                ),
              ),
              new ListTile(
                title: new Text(
                  "清除缓存",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                trailing: new Image.asset(
                  "assert/imgs/person_arrow_right_grayx.png",
                  height: 15,
                  width: 15,
                ),
              ),
              new Container(height:screenUtils.setWidgetHeight(10),
                color: Color(0xfffafafa),),
             new Container(
               padding: EdgeInsets.all(screenUtils.setWidgetHeight(15)),
               child:  new Text("退出登录",style: new TextStyle(
                 color: Colors.red,

                 decoration: TextDecoration.none,
                 fontSize: screenUtils.setFontSize(16),
               ),textAlign: TextAlign.center,),
             ),
              new Expanded(child: new Container(color: Color(0xfffafafa),))
            ],
          ),
        ),
    );
  }
}
