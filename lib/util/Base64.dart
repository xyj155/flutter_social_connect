import 'dart:convert';
import 'dart:convert' as convert;
class Base642Text{
  static String encodeBase64(String data){
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /*
  * Base64解密
  */
  static String decodeBase64(String data){
    return convert.utf8.decode(base64Decode(data));
  }

}