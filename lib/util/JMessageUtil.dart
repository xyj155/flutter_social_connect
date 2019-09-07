import 'package:flutter/services.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:platform/platform.dart';

class JMessageUtil {
  factory JMessageUtil() => _getInstance();

  static JMessageUtil get instance => _getInstance();
  static JMessageUtil _instance;
  JmessageFlutter jmessage;

  JMessageUtil._internal() {
    MethodChannel channel = MethodChannel('jmessage_flutter');
    jmessage = new JmessageFlutter.private(channel, const LocalPlatform());
    jmessage.login(username: "17374131273", password: "xuyijie19971016");
  }

  static JMessageUtil _getInstance() {
    if (_instance == null) {
      _instance = new JMessageUtil._internal();
    }
    return _instance;
  }

  Future<JMConversationInfo> createConversation() async {
    Map<String, String> userMap = new Map();
    userMap.putIfAbsent("username", () => "1234567");
    JMConversationInfo conversation = await jmessage.createConversation(
      target: JMSingle.fromJson(userMap),
    );
    return conversation;
  }

  createMessage() async {
    Map<String, String> userMap = new Map();
    userMap.putIfAbsent("username", () => "1234567");
    JMTextMessage msg = await jmessage.sendTextMessage(
        type: JMSingle.fromJson(userMap),
        text: 'Text Message Test!',
        sendOption: JMMessageSendOptions.fromJson({
          'isShowNotification': true,
          'isRetainOffline': true,
        }));
  }
}
