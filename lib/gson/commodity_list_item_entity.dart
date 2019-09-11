class CommodityListItemEntity {
	String msg;
	int code;
	List<CommodityListItemData> data;

	CommodityListItemEntity({this.msg, this.code, this.data});

	CommodityListItemEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<CommodityListItemData>();(json['data'] as List).forEach((v) { data.add(new CommodityListItemData.fromJson(v)); });
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

class CommodityListItemData {
	String foodPicture;
	int activityId;
	String foodsOwner;
	String foodName;
	String foodsOrign;
	String needCount;
	int id;
	String foodsSize;
	String foodsPrice;
	int kindId;
	String isShow;

	CommodityListItemData({this.foodPicture, this.activityId, this.foodsOwner, this.foodName, this.foodsOrign, this.needCount, this.id, this.foodsSize, this.foodsPrice, this.kindId, this.isShow});

	CommodityListItemData.fromJson(Map<String, dynamic> json) {
		foodPicture = json['foodPicture'];
		activityId = json['activityId'];
		foodsOwner = json['foodsOwner'];
		foodName = json['foodName'];
		foodsOrign = json['foodsOrign'];
		needCount = json['needCount'];
		id = json['id'];
		foodsSize = json['foodsSize'];
		foodsPrice = json['foodsPrice'];
		kindId = json['kindId'];
		isShow = json['isShow'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['foodPicture'] = this.foodPicture;
		data['activityId'] = this.activityId;
		data['foodsOwner'] = this.foodsOwner;
		data['foodName'] = this.foodName;
		data['foodsOrign'] = this.foodsOrign;
		data['needCount'] = this.needCount;
		data['id'] = this.id;
		data['foodsSize'] = this.foodsSize;
		data['foodsPrice'] = this.foodsPrice;
		data['kindId'] = this.kindId;
		data['isShow'] = this.isShow;
		return data;
	}
}
