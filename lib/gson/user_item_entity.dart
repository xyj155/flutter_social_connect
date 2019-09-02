class UserItemEntity {
	String msg;
	int code;
	List<UserItemData> data;
	bool status;

	UserItemEntity({this.msg, this.code, this.data, this.status});

	UserItemEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<UserItemData>();(json['data'] as List).forEach((v) { data.add(new UserItemData.fromJson(v)); });
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

class UserItemData {
	dynamic gameType;
	String city;
	dynamic signature;
	dynamic isRoboot;
	String latitude;
	String isOnline;
	String currentCity;
	String hot;
	String isInvite;
	String observe;
	String score;
	String major;
	String school;
	String nickname;
	int id;
	String longitude;
	dynamic gameDesc;
	String sex;
	dynamic birth;
	String updateTime;
	String avatar;
	dynamic isVip;
	String fans;
	String isPermit;
	String createTime;
	dynamic qqId;
	int page;
	dynamic isAllowPlay;
	dynamic vipDate;
	String username;

	UserItemData({this.gameType, this.city, this.signature, this.isRoboot, this.latitude, this.isOnline, this.currentCity, this.hot, this.isInvite, this.observe, this.score, this.major, this.school, this.nickname, this.id, this.longitude, this.gameDesc, this.sex, this.birth, this.updateTime, this.avatar, this.isVip, this.fans, this.isPermit, this.createTime, this.qqId, this.page, this.isAllowPlay, this.vipDate, this.username});

	UserItemData.fromJson(Map<String, dynamic> json) {
		gameType = json['gameType'];
		city = json['city'];
		signature = json['signature'];
		isRoboot = json['isRoboot'];
		latitude = json['latitude'];
		isOnline = json['isOnline'];
		currentCity = json['currentCity'];
		hot = json['hot'];
		isInvite = json['isInvite'];
		observe = json['observe'];
		score = json['score'];
		major = json['major'];
		school = json['school'];
		nickname = json['nickname'];
		id = json['id'];
		longitude = json['longitude'];
		gameDesc = json['gameDesc'];
		sex = json['sex'];
		birth = json['birth'];
		updateTime = json['updateTime'];
		avatar = json['avatar'];
		isVip = json['isVip'];
		fans = json['fans'];
		isPermit = json['isPermit'];
		createTime = json['createTime'];
		qqId = json['qq_id'];
		page = json['page'];
		isAllowPlay = json['isAllowPlay'];
		vipDate = json['vipDate'];
		username = json['username'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['gameType'] = this.gameType;
		data['city'] = this.city;
		data['signature'] = this.signature;
		data['isRoboot'] = this.isRoboot;
		data['latitude'] = this.latitude;
		data['isOnline'] = this.isOnline;
		data['currentCity'] = this.currentCity;
		data['hot'] = this.hot;
		data['isInvite'] = this.isInvite;
		data['observe'] = this.observe;
		data['score'] = this.score;
		data['major'] = this.major;
		data['school'] = this.school;
		data['nickname'] = this.nickname;
		data['id'] = this.id;
		data['longitude'] = this.longitude;
		data['gameDesc'] = this.gameDesc;
		data['sex'] = this.sex;
		data['birth'] = this.birth;
		data['updateTime'] = this.updateTime;
		data['avatar'] = this.avatar;
		data['isVip'] = this.isVip;
		data['fans'] = this.fans;
		data['isPermit'] = this.isPermit;
		data['createTime'] = this.createTime;
		data['qq_id'] = this.qqId;
		data['page'] = this.page;
		data['isAllowPlay'] = this.isAllowPlay;
		data['vipDate'] = this.vipDate;
		data['username'] = this.username;
		return data;
	}
}
