import 'package:flutter_app/gson/home_title_avatar_entity.dart';
import 'package:flutter_app/gson/home_user_topic_entity.dart';
import 'package:flutter_app/gson/square_banner_entity.dart';
import 'package:flutter_app/gson/user_contact_list_entity.dart';
import 'package:flutter_app/gson/user_item_entity.dart';
import 'package:flutter_app/gson/user_post_item_detail_entity.dart';
import 'package:flutter_app/gson/user_post_item_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeTitleAvatarEntity") {
      return HomeTitleAvatarEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeUserTopicEntity") {
      return HomeUserTopicEntity.fromJson(json) as T;
    } else if (T.toString() == "SquareBannerEntity") {
      return SquareBannerEntity.fromJson(json) as T;
    } else if (T.toString() == "UserContactListEntity") {
      return UserContactListEntity.fromJson(json) as T;
    } else if (T.toString() == "UserItemEntity") {
      return UserItemEntity.fromJson(json) as T;
    } else if (T.toString() == "UserPostItemDetailEntity") {
      return UserPostItemDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "UserPostItemEntity") {
      return UserPostItemEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}