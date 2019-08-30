class UserPostItemEntity {
	String msg;
	int code;
	List<UserPostItemData> data;
	bool status;

	UserPostItemEntity({this.msg, this.code, this.data, this.status});

	UserPostItemEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<UserPostItemData>();(json['data'] as List).forEach((v) { data.add(new UserPostItemData.fromJson(v)); });
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

class UserPostItemData {
	String postContent;
	int postType;
	int like;
	String postTopic;
	int userId;
	List<String> pictures;
	String topicType;
	String commentCount;
	String timeDuration;
	String shareCount;
	String createTime;
	String duration;
	int isObserve;
	int id;
	String thumbCount;
	UserPostItemDataUser user;

	UserPostItemData({this.postContent,this.timeDuration, this.postType, this.like, this.postTopic, this.userId, this.pictures, this.topicType, this.commentCount, this.duration, this.shareCount, this.createTime, this.isObserve, this.id, this.thumbCount, this.user});

	UserPostItemData.fromJson(Map<String, dynamic> json) {
		postContent = json['postContent'];
		postType = json['postType'];
		timeDuration = json['timeDuration'];
		like = json['like'];
		postTopic = json['postTopic'];
		userId = json['userId'];
		pictures = json['pictures']?.cast<String>();
		topicType = json['topicType'];
		commentCount = json['commentCount'];
		duration = json['duration'];
		shareCount = json['shareCount'];
		createTime = json['createTime'];
		isObserve = json['isObserve'];
		id = json['id'];
		thumbCount = json['thumbCount'];
		user = json['user'] != null ? new UserPostItemDataUser.fromJson(json['user']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['postContent'] = this.postContent;
		data['postType'] = this.postType;
		data['like'] = this.like;
		data['postTopic'] = this.postTopic;
		data['userId'] = this.userId;
		data['pictures'] = this.pictures;
		data['topicType'] = this.topicType;
		data['commentCount'] = this.commentCount;
		data['duration'] = this.duration;
		data['shareCount'] = this.shareCount;
		data['createTime'] = this.createTime;
		data['isObserve'] = this.isObserve;
		data['id'] = this.id;
		data['thumbCount'] = this.thumbCount;
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		return data;
	}
}

class UserPostItemDataUser {
	int uid;
	String city;
	String school;

	String sex;
	String nickname;
	String avatar;
	String username;

	UserPostItemDataUser({this.uid, this.city, this.school,  this.sex, this.nickname, this.avatar, this.username});

	UserPostItemDataUser.fromJson(Map<String, dynamic> json) {
		uid = json['uid'];
		city = json['city'];
		school = json['school'];
		sex = json['sex'];
		nickname = json['nickname'];
		avatar = json['avatar'];
		username = json['username'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['uid'] = this.uid;
		data['city'] = this.city;
		data['school'] = this.school;
		data['sex'] = this.sex;
		data['nickname'] = this.nickname;
		data['avatar'] = this.avatar;
		data['username'] = this.username;
		return data;
	}
}
