import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:like_this/api/Api.dart';
import 'package:like_this/gson/user_contact_list_entity.dart';
import 'package:like_this/util/AppEncryptionUtil.dart';
import 'package:like_this/util/CommonBack.dart';
import 'package:like_this/util/HttpUtil.dart';
import 'package:like_this/util/ScreenUtils.dart';

class UserContactsListPage extends StatefulWidget {
  @override
  _UserContactsListPageState createState() => _UserContactsListPageState();
}

ScreenUtils screenUtils = new ScreenUtils();

class _UserContactsListPageState extends State<UserContactsListPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    getUserContactList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenUtils.initUtil(context);
    return Scaffold(
      appBar: BackUtil.NavigationBack(context, "好友列表"),
      body: EasyRefresh(
        header: ClassicalHeader(
            enableInfiniteRefresh: false,
            refreshText: "正在刷新...",
            refreshReadyText: "下拉我刷新哦！",
            refreshingText: "还在刷新哦！",
            refreshedText: "刷新好了哦！嘻嘻",
            refreshFailedText: "刷新失败了哦！",
            noMoreText: "没有数据了",
            infoText: "",
            bgColor: Colors.white,
            infoColor: Colors.white),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {});
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {});
          });
        },
        child: new ListView.builder(
            itemCount: _list.length,
            itemBuilder: (BuildContext context, int position) {
              return setUserContactList(_list[position]);
            }),
      ),
    );
  }

  List<UserContactListData> _list = new List();

  void getUserContactList() async {
    var response =
        await HttpUtil.getInstance().get(Api.QUERY_POST_BY_POSTID, data: {
      "token": AppEncryptionUtil.currentTimeMillis(),
      "isMobile": AppEncryptionUtil.verifyTokenEncode("true"),
      "userId": "100481"
    });
    print({
      "token": AppEncryptionUtil.currentTimeMillis(),
      "isMobile": AppEncryptionUtil.verifyTokenEncode("true"),
      "userId": "100481"
    });
    var decode = json.decode(response.toString());
    print(decode);
    var userPostItemEntity = UserContactListEntity.fromJson(decode);
    if (userPostItemEntity.code == 200) {
      setState(() {
        _list = userPostItemEntity.data;
      });
    } else {}
  }

  Widget setUserContactList(UserContactListData userContactListData) {
    return GestureDetector(
        child: new Container(
      color: Colors.white,
      child: new GestureDetector(
        child: new Stack(
          alignment: AlignmentDirectional.bottomEnd, //内容对齐方式
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  child: new ClipOval(
                    child: Image.network(
                      userContactListData.avatar,
                      fit: BoxFit.fill,
                      height: 56,
                      width: 56,
                    ),
                  ),
                  padding: EdgeInsets.all(screenUtils.setWidgetWidth(12)),
                ),
                new Expanded(
                    child: new Container(
                  alignment: Alignment.centerLeft,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          userContactListData.nickname,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenUtils.setFontSize(18),
                              decoration: TextDecoration.none),
                        ),
                        padding: EdgeInsets.only(
                            bottom: screenUtils.setWidgetHeight(8)),
                      ),
                      new Image.asset(
                        userContactListData.sex.endsWith("1")
                            ? "assert/imgs/manx.png"
                            : "assert/imgs/womanx.png",
                        width: screenUtils.setWidgetWidth(12),
                        height: screenUtils.setWidgetHeight(12),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ],
        ),
        onTap: () {},
      ),
    ));
  }
}
