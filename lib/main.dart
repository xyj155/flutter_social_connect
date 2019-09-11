
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MainPage.dart';
import 'login/login.dart';
import 'package:platform/platform.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'login/user_register_information.dart';
import 'login/user_register_owner_information.dart';

MethodChannel channel = MethodChannel('jmessage_flutter');
JmessageFlutter jmessage =
    new JmessageFlutter.private(channel, const LocalPlatform());

void main() => runApp(new MyApp());

void JMessageLogin() async {
  jmessage.login(username: "17374131273", password: "xuyijie19971016");
  JMUserInfo u = await jmessage.getMyInfo();
  print(u.nickname + "==============");
}



JPush jPush = new JPush();

void startupJpush() async {
  print("初始化jpush");
  jPush.setup(
      appKey: "a96bfaaaaa323f4e0e137fb0",
      channel: "developer-default",
      debug: true);
  print("初始化jpush成功");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    jmessage..setDebugMode(enable: true);
    jmessage.init(
        isOpenMessageRoaming: true, appkey: "a96bfaaaaa323f4e0e137fb0");
    jmessage.applyPushAuthority(
        new JMNotificationSettingsIOS(sound: true, alert: true, badge: true));
    JMessageLogin();
    startupJpush();
    return Material(
      color: Colors.white,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserAvatarRegisterPage(), //启动MainPage
      ),
    );
//    return ;
  }
}
