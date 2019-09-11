class ShopKindListEntity {
	String msg;
	int code;
	List<ShopKindListData> data;

	ShopKindListEntity({this.msg, this.code, this.data});

	ShopKindListEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<ShopKindListData>();(json['data'] as List).forEach((v) { data.add(new ShopKindListData.fromJson(v)); });
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

class ShopKindListData {
	String kindName;
	int id;

	ShopKindListData({this.kindName, this.id});

	ShopKindListData.fromJson(Map<String, dynamic> json) {
		kindName = json['kindName'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['kindName'] = this.kindName;
		data['id'] = this.id;
		return data;
	}
}
