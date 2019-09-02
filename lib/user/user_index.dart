import 'package:flutter/material.dart';

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

class UserPageIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new  Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(top: 16, left: 20, bottom: 20),
            child: new Text("我的",
                style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            alignment: Alignment.topLeft,
          ),
          new Divider(indent: 20, height: 16.0, color:  Colors.transparent),
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
          new Container( height: 5.0, color: Color(0xfffafafa),margin: EdgeInsets.only(top: 16),),
          new ListTile(
            title: new Text(
              "我的发帖",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
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
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
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
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
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
          new Divider(
              indent: 30,
              height: 16.0,
              color: Color.fromARGB(255, 216, 216, 216)),
          new ListTile(
            title: new Text(
              "抽奖",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
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
            title: new Text(
              "邀请",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
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
          new Divider(
              indent: 30,
              height: 16.0,
              color: Color.fromARGB(255, 216, 216, 216)),
          new ListTile(
            title: new Text(
              "设置",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
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
          )
        ],
      ),
    );
  }
}
