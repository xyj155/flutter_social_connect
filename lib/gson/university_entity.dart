class UniversityEntity {
	String msg;
	int code;
	List<UniversityData> data;

	UniversityEntity({this.msg, this.code, this.data});

	UniversityEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<UniversityData>();(json['data'] as List).forEach((v) { data.add(new UniversityData.fromJson(v)); });
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

class UniversityData {
	String school;
	int id;

	UniversityData({this.school, this.id});

	UniversityData.fromJson(Map<String, dynamic> json) {
		school = json['school'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['school'] = this.school;
		data['id'] = this.id;
		return data;
	}
}
