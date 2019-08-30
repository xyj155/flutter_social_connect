class HomeTitleAvatarEntity {
	String msg;
	int code;
	List<HomeTitleAvatarData> data;
	bool status;

	HomeTitleAvatarEntity({this.msg, this.code, this.data, this.status});

	HomeTitleAvatarEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<HomeTitleAvatarData>();(json['data'] as List).forEach((v) { data.add(new HomeTitleAvatarData.fromJson(v)); });
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

class HomeTitleAvatarData {
	String activeName;
	int id;
	String activePicture;
	dynamic activeSorted;

	HomeTitleAvatarData({this.activeName, this.id, this.activePicture, this.activeSorted});

	HomeTitleAvatarData.fromJson(Map<String, dynamic> json) {
		activeName = json['activeName'];
		id = json['id'];
		activePicture = json['activePicture'];
		activeSorted = json['activeSorted'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['activeName'] = this.activeName;
		data['id'] = this.id;
		data['activePicture'] = this.activePicture;
		data['activeSorted'] = this.activeSorted;
		return data;
	}
}
