class HomeUserTopicEntity {
  String msg;
  int code;
  List<HomeUserTopicData> data;
  bool status;

  HomeUserTopicEntity({this.msg, this.code, this.data, this.status});

  HomeUserTopicEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<HomeUserTopicData>();(json['data'] as List).forEach((v) { data.add(new HomeUserTopicData.fromJson(v)); });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class HomeUserTopicData {
  dynamic topicPicUrl;
  String topicName;
  String postCount;
  int id;
  int topicPid;
  dynamic userId;
  List<HomeUserTopicDataChild> child;

  HomeUserTopicData({this.topicPicUrl, this.topicName, this.postCount, this.id, this.topicPid, this.userId, this.child});

  HomeUserTopicData.fromJson(Map<String, dynamic> json) {
    topicPicUrl = json['topicPicUrl'];
    topicName = json['topicName'];
    postCount = json['postCount'];
    id = json['id'];
    topicPid = json['topicPid'];
    userId = json['userId'];
    if (json['child'] != null) {
      child = new List<HomeUserTopicDataChild>();(json['child'] as List).forEach((v) { child.add(new HomeUserTopicDataChild.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topicPicUrl'] = this.topicPicUrl;
    data['topicName'] = this.topicName;
    data['postCount'] = this.postCount;
    data['id'] = this.id;
    data['topicPid'] = this.topicPid;
    data['userId'] = this.userId;
    if (this.child != null) {
      data['child'] =  this.child.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeUserTopicDataChild {
  String topicPicUrl;
  String topicName;
  String postCount;
  int id;
  int topicPid;
  dynamic userId;

  HomeUserTopicDataChild({this.topicPicUrl, this.topicName, this.postCount, this.id, this.topicPid, this.userId});

  HomeUserTopicDataChild.fromJson(Map<String, dynamic> json) {
    topicPicUrl = json['topicPicUrl'];
    topicName = json['topicName'];
    postCount = json['postCount'];
    id = json['id'];
    topicPid = json['topicPid'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topicPicUrl'] = this.topicPicUrl;
    data['topicName'] = this.topicName;
    data['postCount'] = this.postCount;
    data['id'] = this.id;
    data['topicPid'] = this.topicPid;
    data['userId'] = this.userId;
    return data;
  }
}

