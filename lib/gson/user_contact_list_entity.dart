class UserContactListEntity {
	String msg;
	int code;
	List<UserContactListData> data;

	UserContactListEntity({this.msg, this.code, this.data});

	UserContactListEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<UserContactListData>();(json['data'] as List).forEach((v) { data.add(new UserContactListData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class UserContactListData {
	int uid;
	String sex;
	String nickname;
	String isOnline;
	String avatar;
	int id;
	int userId;
	String username;

	UserContactListData({this.uid, this.sex, this.nickname, this.isOnline, this.avatar, this.id, this.userId, this.username});

	UserContactListData.fromJson(Map<String, dynamic> json) {
		uid = json['uid'];
		sex = json['sex'];
		nickname = json['nickname'];
		isOnline = json['isOnline'];
		avatar = json['avatar'];
		id = json['id'];
		userId = json['userId'];
		username = json['username'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['uid'] = this.uid;
		data['sex'] = this.sex;
		data['nickname'] = this.nickname;
		data['isOnline'] = this.isOnline;
		data['avatar'] = this.avatar;
		data['id'] = this.id;
		data['userId'] = this.userId;
		data['username'] = this.username;
		return data;
	}
}
