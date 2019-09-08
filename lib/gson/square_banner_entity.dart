class SquareBannerEntity {
	String msg;
	int code;
	List<SquareBannerData> data;

	SquareBannerEntity({this.msg, this.code, this.data});

	SquareBannerEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<SquareBannerData>();(json['data'] as List).forEach((v) { data.add(new SquareBannerData.fromJson(v)); });
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

class SquareBannerData {
	String bannerUrl;
	String bannerPicture;
	int id;

	SquareBannerData({this.bannerUrl, this.bannerPicture, this.id});

	SquareBannerData.fromJson(Map<String, dynamic> json) {
		bannerUrl = json['bannerUrl'];
		bannerPicture = json['bannerPicture'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['bannerUrl'] = this.bannerUrl;
		data['bannerPicture'] = this.bannerPicture;
		data['id'] = this.id;
		return data;
	}
}
