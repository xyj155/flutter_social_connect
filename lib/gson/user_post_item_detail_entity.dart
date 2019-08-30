class UserPostItemDetailEntity {
	String msg;
	int code;
	List<UserPostItemDetailData> data;
	bool status;

	UserPostItemDetailEntity({this.msg, this.code, this.data, this.status});

	UserPostItemDetailEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<UserPostItemDetailData>();(json['data'] as List).forEach((v) { data.add(new UserPostItemDetailData.fromJson(v)); });
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

class UserPostItemDetailData {
	String postContent;
	int postType;
	int like;
	String postTopic;
	int userId;
	List<String> pictures;
	String timeDuration;
	dynamic topicType;
	int commentCount;
	dynamic duration;
	String shareCount;
	String createTime;
	List<UserPostItemDetailDataCommant> comment;
	int id;
	String thumbCount;
	UserPostItemDetailDataUser user;

	UserPostItemDetailData({this.postContent, this.postType, this.like, this.postTopic, this.userId, this.pictures, this.timeDuration, this.topicType, this.commentCount, this.duration, this.shareCount, this.createTime, this.comment, this.id, this.thumbCount, this.user});

	UserPostItemDetailData.fromJson(Map<String, dynamic> json) {
		postContent = json['postContent'];
		postType = json['postType'];
		like = json['like'];
		postTopic = json['postTopic'];
		userId = json['userId'];
		pictures = json['pictures']?.cast<String>();
		timeDuration = json['timeDuration'];
		topicType = json['topicType'];
		commentCount = json['commentCount'];
		duration = json['duration'];
		shareCount = json['shareCount'];
		createTime = json['createTime'];
		if (json['comment'] != null) {
			comment = new List<UserPostItemDetailDataCommant>();(json['comment'] as List).forEach((v) { comment.add(new UserPostItemDetailDataCommant.fromJson(v)); });
		}
		id = json['id'];
		thumbCount = json['thumbCount'];
		user = json['user'] != null ? new UserPostItemDetailDataUser.fromJson(json['user']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['postContent'] = this.postContent;
		data['postType'] = this.postType;
		data['like'] = this.like;
		data['postTopic'] = this.postTopic;
		data['userId'] = this.userId;
		data['pictures'] = this.pictures;
		data['timeDuration'] = this.timeDuration;
		data['topicType'] = this.topicType;
		data['commentCount'] = this.commentCount;
		data['duration'] = this.duration;
		data['shareCount'] = this.shareCount;
		data['createTime'] = this.createTime;
		if (this.comment != null) {
      data['comment'] =  this.comment.map((v) => v.toJson()).toList();
    }
		data['id'] = this.id;
		data['thumbCount'] = this.thumbCount;
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		return data;
	}
}

class UserPostItemDetailDataCommant {
	String createTime;
	String comment;
	int id;
	int postId;
	dynamic avatar;
	dynamic userId;
	dynamic username;

	UserPostItemDetailDataCommant({this.createTime, this.comment, this.id, this.postId, this.avatar, this.userId, this.username});

	UserPostItemDetailDataCommant.fromJson(Map<String, dynamic> json) {
		createTime = json['createTime'];
		comment = json['comment'];
		id = json['id'];
		postId = json['postId'];
		avatar = json['avatar'];
		userId = json['userId'];
		username = json['username'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['createTime'] = this.createTime;
		data['comment'] = this.comment;
		data['id'] = this.id;
		data['postId'] = this.postId;
		data['avatar'] = this.avatar;
		data['userId'] = this.userId;
		data['username'] = this.username;
		return data;
	}
}

class UserPostItemDetailDataUser {
	dynamic city;
	dynamic school;
	String sex;
	String nickname;
	dynamic birth;
	String avatar;

	UserPostItemDetailDataUser({this.city, this.school, this.sex, this.nickname, this.birth, this.avatar});

	UserPostItemDetailDataUser.fromJson(Map<String, dynamic> json) {
		city = json['city'];
		school = json['school'];
		sex = json['sex'];
		nickname = json['nickname'];
		birth = json['birth'];
		avatar = json['avatar'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['city'] = this.city;
		data['school'] = this.school;
		data['sex'] = this.sex;
		data['nickname'] = this.nickname;
		data['birth'] = this.birth;
		data['avatar'] = this.avatar;
		return data;
	}
}
