

import 'gson/home_title_avatar_entity.dart';
import 'gson/home_user_topic_entity.dart';
import 'gson/user_contact_list_entity.dart';
import 'gson/user_post_item_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeTitleAvatarEntity") {
      return HomeTitleAvatarEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeUserTopicEntity") {
      return HomeUserTopicEntity.fromJson(json) as T;
    } else if (T.toString() == "UserContactListEntity") {
      return UserContactListEntity.fromJson(json) as T;
    } else if (T.toString() == "UserPostItemEntity") {
      return UserPostItemEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}