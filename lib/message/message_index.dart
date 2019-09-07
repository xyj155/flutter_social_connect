import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:like_this/message/user_contacts_list.dart';
import 'package:like_this/util/JMessageUtil.dart';
import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/util/ToastUtil.dart';
import 'package:like_this/util/TransationUtil.dart';
import 'package:platform/platform.dart';

import 'conversation_list.dart';

class MessagePageIndex extends StatefulWidget {
  @override
  _MessagePageIndexState createState() => _MessagePageIndexState();
}

class _MessagePageIndexState extends State<MessagePageIndex>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  ScreenUtils screenUtils = new ScreenUtils();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    initJMessageConversation();
    super.initState();
  }

  List<JMConversationInfo> conversations = new List();
  JMessageUtil manager = new JMessageUtil();

  Future initJMessageConversation() async {
    MethodChannel channel = MethodChannel('jmessage_flutter');
    JmessageFlutter jmessage =
        new JmessageFlutter.private(channel, const LocalPlatform());
    jmessage.login(username: "17374131273", password: "xuyijie19971016");
    if (jmessage != null) {
      conversations = await jmessage.getConversations();
//      JMConversationInfo createConversation =
//          await manager.createConversation();
//      manager.createMessage();
      ToastUtil.showCommonToast("发送消息成功！");
    } else {
      ToastUtil.showCommonToast("获取消息列表失败！");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenUtils.initUtil(context);
    return new Container(
    child: new Column(
      children: <Widget>[
        new Container(
            child: new Text("消息",
                style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            padding: new EdgeInsets.only(top: 16, left: 20, bottom: 20),
        alignment: Alignment.centerLeft,),
        new ListTile(
            title: new Text("点赞",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 53, 225, 191)),
            ),
            leading: new Image.asset(
              "assert/imgs/message_like.png",
              width: 39,
              height: 39,
            ),trailing: new Image.asset(
          "assert/imgs/message_thumb_arrow_right.png",
          height: 15,
          width: 15,
        )
        ),
        new Divider(
          indent: 40,
          height: 10,
          color: Color(0xfffafafa),
        ),
        new ListTile(
          title: new Text(
            "回复",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 156, 222, 195)),
          ),
          trailing: new Image.asset(
            "assert/imgs/message_notice_arrow_right.png",
            height: 15,
            width: 15,
          ),
          leading: new Image.asset(
            "assert/imgs/message_notice.png",
            width: 39,
            height: 39,
          ),
        ),
        new Divider(
          height: 10,
          indent: 40,
          color: Color(0xfffafafa),
        ),
        new ListTile(
          onTap: (){
            Navigator.push(context, CustomRouteSlide(UserContactsListPage()));
          },
          title: new Text(
            "好友",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 127, 161, 246)),
          ),
          leading: new Image.asset(
            "assert/imgs/message_chat.png",
            width: 39,
            height: 39,
          ),
          trailing: new Image.asset(
            "assert/imgs/message_chat_arrow_right.png",
            height: 15,
            width: 15,
          ),
        ),
        new Divider(
          indent: 40,
          height: 10,
          color: Color(0xfffafafa),
        ),
        new ListTile(
          onTap: (){
            Navigator.push(context, CustomRouteSlide(ConversationListPage()));
          },
          title: new Text(
            "消息",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 92, 195, 255)),
          ),
          leading: new Image.asset(
            "assert/imgs/message_reply.png",
            width: 39,
            height: 39,
          ),
          trailing: new Image.asset(
            "assert/imgs/message_reply_arrow_right.png",
            height: 15,
            width: 15,
          ),
        ),
        new Divider(
          height: 10,
          indent: 40,
          color: Color(0xfffafafa),
        ),

      ],
    ),

    );
  }


}
