import 'gson/commodity_list_item_entity.dart';
import 'gson/home_title_avatar_entity.dart';
import 'gson/home_user_topic_entity.dart';
import 'gson/shop_kind_list_entity.dart';
import 'gson/square_banner_entity.dart';
import 'gson/university_entity.dart';

import 'gson/user_item_entity.dart';
import 'gson/user_post_item_entity.dart';


class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "CommodityListItemEntity") {
      return CommodityListItemEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeTitleAvatarEntity") {
      return HomeTitleAvatarEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeUserTopicEntity") {
      return HomeUserTopicEntity.fromJson(json) as T;
    } else if (T.toString() == "ShopKindListEntity") {
      return ShopKindListEntity.fromJson(json) as T;
    } else if (T.toString() == "SquareBannerEntity") {
      return SquareBannerEntity.fromJson(json) as T;
    }else if (T.toString() == "UserItemEntity") {
      return UserItemEntity.fromJson(json) as T;
    }  else if (T.toString() == "UserPostItemEntity") {
      return UserPostItemEntity.fromJson(json) as T;
    }  else if (T.toString() == "UniversityEntity") {
      return UniversityEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}