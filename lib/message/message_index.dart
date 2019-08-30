import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: '',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MessagePageIndex(),
    ),
  );
}

class MessagePageIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
            child: new Text("消息",
                style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            padding: new EdgeInsets.only(top: 16, left: 20, bottom: 20)),
        new ListTile(
          title: new Text(
            "回复",
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
        ),  new Divider(
          indent: 40,
          height: 10,
          color: Color(0xfffafafa),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
