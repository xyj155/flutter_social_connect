import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MainPage.dart';
import 'login/login.dart';
import 'package:platform/platform.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

MethodChannel channel = MethodChannel('jmessage_flutter');
JmessageFlutter jmessage =
    new JmessageFlutter.private(channel, const LocalPlatform());

void main() => runApp(new MyApp());

void JMessageLogin() async {
  jmessage.login(username: "17374131273", password: "xuyijie19971016");
  JMUserInfo u = await jmessage.getMyInfo();
  print(u.nickname+"==============");
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
    return Material(
      color: Colors.blue,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(), //启动MainPage
      ),
    );
//    return ;
  }
}
