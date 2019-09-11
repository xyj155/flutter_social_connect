import 'dart:convert';

import 'package:like_this/api/Api.dart';
import 'package:like_this/gson/shop_kind_list_entity.dart';
import 'package:like_this/gson/commodity_list_item_entity.dart';
import 'package:like_this/util/CommonBack.dart';
import 'package:like_this/util/HttpUtil.dart';
import 'package:like_this/util/ScreenUtils.dart';
import 'package:tobias/tobias.dart' as tobias;
import 'package:flutter/material.dart';

class LittleShopPage extends StatefulWidget {
  @override
  _LittleShopPageState createState() => _LittleShopPageState();
}

ScreenUtils screenUtils = new ScreenUtils();

class _LittleShopPageState extends State<LittleShopPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int index;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    getCommodityKindItem();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenUtils.initUtil(context);
    return Scaffold(
        appBar: BackUtil.NavigationBack(context, "小卖部"),
        body: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  child: new ListView.builder(
                      itemCount: _commodity_kind.length,
                      itemBuilder: (BuildContext context, int position) {
                        return getCommodityKind(position);
                      }),
                )),
            new Expanded(
              flex: 5,
              child: new ListView.builder(
                  itemCount: _commodity_list.length,
                  itemBuilder: (BuildContext context, int position) {
                    return getCommodityItem(position);
                  }),
            ),
          ],
        ));
  }

  List<ShopKindListData> _commodity_kind = new List();
  int shopId;

  getCommodityKindItem() async {
    var response = await HttpUtil.getInstance().get(Api.COMMODITY_KIND_ITEM);
    var decode = json.decode(response);
    var shopKindListEntity = ShopKindListEntity.fromJson(decode);
    if (shopKindListEntity.code == 200) {
      setState(() {
        _commodity_kind = shopKindListEntity.data;
        index = 0;
        shopId = shopKindListEntity.data[0].id;
        setState(() {
          getCommodityById(shopId);
        });
      });
    }
  }

  Widget getCommodityKind(int i) {
    return new GestureDetector(
      child: new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
                width: 5, color: index == i ? Color(0xff4ddfa9) : Colors.white),
          ),
        ),
        child: Text(_commodity_kind[i].kindName,
            style: TextStyle(
                color: Colors.black,
                fontWeight: index == i ? FontWeight.w600 : FontWeight.w400,
                fontSize: 16)),
      ),
      onTap: () {
        setState(() {
          index = i; //记录选中的下标
          setState(() {
            getCommodityById(_commodity_kind[i].id);
          });
        });
      },
    );
  }

  List<CommodityListItemData> _commodity_list = new List();

  getCommodityById(int commodity) async {
    Map<String, dynamic> _parama = new Map();
    _parama.putIfAbsent("shopId", () => commodity);
    var response = await HttpUtil.getInstance()
        .get(Api.COMMODITY_ALL_BY_ID, data: _parama);
    var decode = json.decode(response);
    print("-----------------------------");
    print(response);
    print("-----------------------------");
    var shopKindListEntity = CommodityListItemEntity.fromJson(decode);
    if (shopKindListEntity.code == 200) {
      setState(() {
        _commodity_list = shopKindListEntity.data;
      });
    }
  }

  Widget getCommodityItem(int i) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.all(screenUtils.setWidgetWidth(7)),
      child: new Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          new Row(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage.assetNetwork(
                    placeholder: "assert/imgs/loading.gif",
                    image: _commodity_list[i].foodPicture,
                    fit: BoxFit.cover,
                    width: screenUtils.setWidgetWidth(74),
                    height: screenUtils.setFontSize(74),
                  )),
              new Expanded(
                  child: new Container(
                padding: EdgeInsets.only(left: screenUtils.setWidgetHeight(6)),
                alignment: Alignment.centerLeft,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(
                          top: screenUtils.setWidgetHeight(6),
                          bottom: screenUtils.setWidgetHeight(6),
                          right: screenUtils.setWidgetHeight(6)),
                      child: new Text(
                        _commodity_list[i].foodName,
                        style: new TextStyle(
                            fontSize: screenUtils.setFontSize(15),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: new Container(
                        padding: EdgeInsets.all(1.5),
                        color: Color(0xffffe300),
                        child: new Text(_commodity_list[i].foodsSize,
                            style: new TextStyle(
                                fontSize: screenUtils.setFontSize(12),
                                decoration: TextDecoration.none,
                                color: Colors.white)),
                      ),
                    ),
                    new Container(
                      padding:
                          EdgeInsets.only(top: screenUtils.setWidgetHeight(6)),
                      child: new RichText(
                          text: new TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: '￥',
                            style: TextStyle(
                                fontSize: screenUtils.setFontSize(13),
                                color: Colors.black,
                                fontWeight: FontWeight.w200)),
                        TextSpan(
                            text: _commodity_list[i].foodsPrice.substring(
                                0, _commodity_list[i].foodsPrice.indexOf(".")),
                            style: TextStyle(
                                fontSize: screenUtils.setFontSize(20),
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: _commodity_list[i].foodsPrice.substring(
                                _commodity_list[i].foodsPrice.indexOf(".")),
                            style: TextStyle(
                                fontSize: screenUtils.setFontSize(17),
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ])),
                    )
                  ],
                ),
              ))
            ],
          ),
          new Container(
            margin: EdgeInsets.only(bottom: screenUtils.setWidgetHeight(2)),
            child: new Image.asset(
              "assert/imgs/ic_shopcar.png",
              width: screenUtils.setWidgetWidth(22),
              height: screenUtils.setWidgetHeight(22),
            ),
          )
        ],
      ),
    );
  }
}
