import 'dart:convert';

class AppEncryptionUtil {
  static verifyTokenEncode(String str) {
    var content = utf8.encode(str);
    var digest = base64Encode(content);
    var length = digest.length;
    var d = length / 2;
    int middle = d.floor();
    var string_head = digest.substring(0, middle);
    var string_rear = digest.substring(middle, length);
    String total_str = string_rear + string_head;
    return reverseStr(total_str);
  }

  static String currentTimeMillis() {
    int millisecondsSinceEpoch = new DateTime.now().millisecondsSinceEpoch;
    var content = utf8.encode(millisecondsSinceEpoch.toString().substring(0,10));
    var digest = base64Encode(content);
    return verifyTokenEncode(digest);
  }

  static String reverseStr(String string) {
    StringBuffer stringBuffer=new StringBuffer();
    for (int i = string.length - 1; i >= 0; i--) {
      stringBuffer.write(string[i]);
    }
    print(stringBuffer.toString()+'------------');
    return stringBuffer.toString();
  }
}
