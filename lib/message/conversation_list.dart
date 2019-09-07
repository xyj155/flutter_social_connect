import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:like_this/message/single_conversation.dart';
import 'package:like_this/util/CommonBack.dart';
import 'package:like_this/util/JMessageUtil.dart';
import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/util/ToastUtil.dart';
import 'package:like_this/util/TransationUtil.dart';
import 'package:platform/platform.dart';

class ConversationListPage extends StatefulWidget {
  @override
  _ConversationListPageState createState() => _ConversationListPageState();
}

class _ConversationListPageState extends State<ConversationListPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<JMConversationInfo> conversationsList = new List();
  JMessageUtil manager = new JMessageUtil();

  Future initJMessageConversation() async {
    MethodChannel channel = MethodChannel('jmessage_flutter');
    JmessageFlutter jmessage =
        new JmessageFlutter.private(channel, LocalPlatform());
    jmessage.login(username: "17374131273", password: "xuyijie19971016");
    if (jmessage != null) {
      List<JMConversationInfo> conversations =
          await jmessage.getConversations();
      setState(() {
        conversationsList = conversations;
      });
//      JMConversationInfo createConversation =
//          await manager.createConversation();
//      manager.createMessage();
      ToastUtil.showCommonToast("发送消息成功！");
    } else {
      ToastUtil.showCommonToast("获取消息列表失败！");
    }
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    initJMessageConversation();
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
      appBar: BackUtil.NavigationBack(context, "消息"),
      body: getResponseBody(),
    );
  }

  getResponseBody() {
    if (conversationsList.length != 0) {
      return new ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          return userMsgList(conversationsList[position]);
        },
        itemCount: conversationsList.length,
      );
    } else {
      // 加载菊花
      return CupertinoActivityIndicator();
    }
  }

  ScreenUtils screenUtils = new ScreenUtils();

  Widget userMsgList(JMConversationInfo conversationInfo) {
    print("------------------------------");
    print(conversationInfo.title);
    print("------------------------------");
    JMTextMessage jmTextMessage = conversationInfo.latestMessage;
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
                      "https://img.zcool.cn/community/011cff5c7e3893a801213f26f4fed1.jpg@2o.jpg",
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
                          conversationInfo.title,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenUtils.setFontSize(18),
                              decoration: TextDecoration.none),
                        ),
                        padding: EdgeInsets.only(
                            bottom: screenUtils.setWidgetHeight(8)),
                      ),
                      new Text(
                        jmTextMessage.text,
                        style: new TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff8a8a8a),
                            fontSize: screenUtils.setFontSize(14),
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ))
              ],
            ),
            new Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.all(screenUtils.setWidgetHeight(6)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child:
                    new Text(String.fromCharCode(conversationInfo.unreadCount)),
              ),
            )
          ],
        ),
        onTap: () {
          JMUserInfo target = conversationInfo.target;
          Navigator.push(
              context,
              CustomRouteSlide(SingleConversationPage(
                userId: target.username,
                username: target.nickname,
              )));
        },
      ),
    ));
  }
}
