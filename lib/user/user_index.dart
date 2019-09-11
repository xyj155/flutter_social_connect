import 'package:flutter/material.dart';
import 'package:like_this/common/common_webview_page.dart';
import 'package:like_this/user/user_detail_center.dart';
import 'package:like_this/user/user_setting.dart';
import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/util/TransationUtil.dart';

import 'user_game_list.dart';

void main() {
  runApp(
    new MaterialApp(
      title: '',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new UserPageIndex(),
    ),
  );
}

ScreenUtils screenUtil = new ScreenUtils();

class UserPageIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenUtil.initUtil(context);
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(top: screenUtil.setWidgetHeight(16), left: screenUtil.setWidgetWidth(20), bottom: screenUtil.setWidgetHeight(20)),
            child: new Text("我的",
                style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            alignment: Alignment.topLeft,
          ),
          new GestureDetector(
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (_) {
                return new UserDetailCenterPage();
              }));
            },
            child: new Container(
              padding: new EdgeInsets.only(left: screenUtil.setWidgetWidth(20), bottom: screenUtil.setWidgetHeight(5), right:screenUtil.setWidgetWidth(20)),
              child: new Row(
                children: <Widget>[
                  new ClipOval(
                    child: Image.network(
                      "https://img.zcool.cn/community/011cff5c7e3893a801213f26f4fed1.jpg@2o.jpg",
                      fit: BoxFit.fill,
                      height: screenUtil.setWidgetHeight(72),
                      width: screenUtil.setWidgetWidth(72),
                    ),
                  ),
                  new Expanded(
                      child: new Container(
                        padding: EdgeInsets.only(left: 20),
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                "用户名",
                                style: new TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.bold),
                              ),
                              new Divider(
                                color: Colors.transparent,
                                height: 10,
                              ),
                              new Text(
                                "个性签名",
                                style: new TextStyle(
                                    fontSize: 14, color: Color(0xff8a8a8a)),
                              ),
                            ]),
                      )),
                  new Image.asset(
                    "assert/imgs/person_arrow_right_grayx.png",
                    width: 15,
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          new Divider(indent: 20, height: 16.0, color: Colors.transparent),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Column(
                  children: <Widget>[
                    new Text(
                      "0",
                      style: new TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000000)),
                    ),
                    new Text(
                      "粉丝",
                      style: new TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              new Expanded(
                child: new Column(
                  children: <Widget>[
                    new Text(
                      "0",
                      style: new TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000000)),
                    ),
                    new Text(
                      "关注",
                      style: new TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              new Expanded(
                child: new Column(
                  children: <Widget>[
                    new Text(
                      "0",
                      style: new TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000000)),
                    ),
                    new Text(
                      "积分",
                      style: new TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          new Container(
            height: 5.0,
            color: Color(0xfffafafa),
            margin: EdgeInsets.only(top: 16),
          ),
          new ListTile(
            title: new Text(
              "我的发帖",
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
            leading: new Image.asset(
              "assert/imgs/ic_user_post_collection.png",
              width: 20,
              height: 20,
            ),
          ),
          new ListTile(
            title: new Text(
              "我的收藏",
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
            leading: new Image.asset(
              "assert/imgs/ic_user_collection.png",
              width: 20,
              height: 20,
            ),
          ),
          new ListTile(
            title: new Text(
              "浏览历史",
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
            leading: new Image.asset(
              "assert/imgs/ic_user_view_history.png",
              width: 20,
              height: 20,
            ),
          ),
          new Container(
              height: screenUtil.setWidgetHeight(10),
              color: Color(0xfffafafa)),
          new ListTile(
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (_) {
                return new CommonWebViewPage(
                    url:
                    "http://sxystushop.xyz/JustLikeThis/public/luckdraw/default.html");
              }));
            },
            title: new Text(
              "抽奖",
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
            leading: new Image.asset(
              "assert/imgs/ic_user_prize.png",
              width: 20,
              height: 20,
            ),
          ),
          new ListTile(
            onTap: (){
              Navigator.push(context, new MaterialPageRoute(builder: (_){
                return new UserGameListPage();
              }));
            },
            title: new Text(
              "玩游戏 送礼品",
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
            leading: new Image.asset(
              "assert/imgs/ic_user_game.png",
              width: 20,
              height: 20,
            ),
          ),
          new ListTile(
            title: new Text(
              "邀请",
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
            leading: new Image.asset(
              "assert/imgs/ic_user_invite.png",
              width: 20,
              height: 20,
            ),
          ),
          new Container(
              height: screenUtil.setWidgetHeight(10),
              color: Color(0xfffafafa)),
          new ListTile(
            onTap: () {
              Navigator.push(
                  context, new CustomRouteSlide(new UserSettingPageIndex()));
            },
            title: new Text(
              "设置",
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
            leading: new Image.asset(
              "assert/imgs/ic_user_setting.png",
              width: 20,
              height: 20,
            ),
          ),
          new Expanded(child: new Container(
              height: screenUtil.setWidgetHeight(10),
              color: Color(0xfffafafa))),
        ],
      ),
    );
  }
}
