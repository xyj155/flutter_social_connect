import 'package:like_this/gson/home_title_avatar_entity.dart';
import 'package:like_this/gson/home_user_topic_entity.dart';
import 'package:like_this/gson/user_item_entity.dart';
import 'package:like_this/gson/user_post_item_detail_entity.dart';
import 'package:like_this/gson/user_post_item_entity.dart';


class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeTitleAvatarEntity") {
      return HomeTitleAvatarEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeUserTopicEntity") {
      return HomeUserTopicEntity.fromJson(json) as T;
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