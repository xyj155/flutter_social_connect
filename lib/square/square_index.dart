import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:like_this/api/Api.dart';
import 'package:like_this/square/square_little_shop.dart';
import 'package:like_this/util/HttpUtil.dart';
import 'package:like_this/gson/user_item_entity.dart';
import 'package:like_this/gson/square_banner_entity.dart';
import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/util/ToastUtil.dart';

class SquarePageIndex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SquarePageState();
  }
}

class SquarePageState extends State<SquarePageIndex>
    with AutomaticKeepAliveClientMixin {
  ScreenUtils screenUtils = new ScreenUtils();
  List<UserItemData> _user_purse_items;

  @override
  Widget build(BuildContext context) {
    screenUtils.initUtil(context);

    return new Column(
      children: <Widget>[
        new Container(
          color: Colors.white,
          child: new ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 42,
              color: Color(0xfff7f7f7),
              padding: EdgeInsets.only(left: 15),
              margin: EdgeInsets.only(left: 10, right: 10),
              child: new Row(
                children: <Widget>[
                  new Image.asset(
                    "assert/imgs/ic_square_search.png",
                    width: 23,
                    height: 23,
                  ),
                  new Text(
                    "    搜索你想的帖子",
                    style: new TextStyle(
                      color: Color(0xffdbdbdb),
                    ),
                  ),
                ],
              ),
            ),
          ),
          margin: EdgeInsets.only(top: screenUtils.setWidgetHeight(17)),
        ),
        new Container(
          padding: EdgeInsets.only(
              top: screenUtils.setWidgetHeight(6),
              right: screenUtils.setWidgetWidth(10),
              left: screenUtils.setWidgetWidth(10)),
          height: screenUtils.setWidgetHeight(110),
          child: _user_purse_items == null
              ? new CupertinoActivityIndicator()
              : new ListView.builder(
                  itemCount: _user_purse_items.length,
                  itemBuilder: (BuildContext context, int position) {
                    print("===================================" +
                        String.fromCharCode(position));
                    return homeTitleItemView(context, position);
                  },
                  scrollDirection: Axis.horizontal),
        ),
        new Container(
            margin: EdgeInsets.only(left: 14, right: 14),
            width: MediaQuery.of(context).size.width,
            height: 140.0,
            child: Swiper(
              pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeSize: 11,
                size: 8,
                activeColor: Color(0xffffffff),
              )),
              itemBuilder: _swiperBuilder,
              itemCount: _banner_list.length,
              scrollDirection: Axis.horizontal,
              autoplay: true,
              onTap: (index) => print('点击了第$index个'),
            )),
        new Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
              left: screenUtils.setWidgetHeight(18),
              top: screenUtils.setWidgetHeight(8),
              bottom: screenUtils.setWidgetHeight(8)),
          child: new Text(
            "精彩生活",
            style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenUtils.setFontSize(17),
                decoration: TextDecoration.none),
          ),
        ),
        new SingleChildScrollView(
            //true 滑动到底部
            reverse: false,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(0.0),
            //滑动到底部回弹效果
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Row(
                children: <Widget>[
                  new Container(
                    width: screenUtils.setWidgetWidth(155),
                    height: screenUtils.setWidgetHeight(87),
                    child: new Image.asset(
                      "assert/imgs/school_purse.png",
                      width: screenUtils.setWidgetWidth(155),
                      height: screenUtils.setWidgetHeight(87),
                    ),
                  ),
                  new Container(
                    width: screenUtils.setWidgetWidth(155),
                    height: screenUtils.setWidgetHeight(87),
                    child: new Image.asset(
                      "assert/imgs/school_part_time.png",
                      width: screenUtils.setWidgetWidth(155),
                      height: screenUtils.setWidgetHeight(87),
                    ),
                  ),
                  new Container(
                    width: screenUtils.setWidgetWidth(155),
                    height: screenUtils.setWidgetHeight(87),
                    child: new Image.asset(
                      "assert/imgs/school_active.png",
                      width: screenUtils.setWidgetWidth(155),
                      height: screenUtils.setWidgetHeight(87),
                    ),
                  ),
                  new GestureDetector(
                    child: new Container(
                      width: screenUtils.setWidgetWidth(155),
                      height: screenUtils.setWidgetHeight(87),
                      child: new Image.asset(
                        "assert/imgs/school_shop.png",
                        width: screenUtils.setWidgetWidth(155),
                        height: screenUtils.setWidgetHeight(87),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new LittleShopPage()));
                    },
                  ),
                ],
              ),
            )),
        new Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
              left: screenUtils.setWidgetHeight(18),
              top: screenUtils.setWidgetHeight(8),
              bottom: screenUtils.setWidgetHeight(8)),
          child: new Text(
            "附近店家",
            style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenUtils.setFontSize(17),
                decoration: TextDecoration.none),
          ),
        ),
      
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getBanner();
    getPurseUserList();
  }

  getPurseUserList() async {
    var response = await HttpUtil().get(Api.SQUARE_PURSE_USER);
    final body = json.decode(response.toString());
    print("=====================");
    print(response.toString());
    print("=====================");
    setState(() {
      UserItemEntity code = UserItemEntity.fromJson(body);
      if (body != null) {
        _user_purse_items = code.data;
      }
    });
  }

  List<SquareBannerData> _banner_list = new List();

  getBanner() async {
    var response = await HttpUtil().get(Api.SQUARE_BANNER);
    final body = json.decode(response);
    var squareBannerEntity = SquareBannerEntity.fromJson(body);
    print(body);
    if (squareBannerEntity.code == 200) {
      if (body != null) {
        _banner_list = squareBannerEntity.data;
      } else {
        ToastUtil.showErrorToast("请求出错");
      }
    }
  }

  //轮播图
  Widget _swiperBuilder(BuildContext context, int index) {
    print("===================================");
    print(_banner_list[index].bannerPicture);
    print("===================================");
    return (new ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        _banner_list[index].bannerPicture,
        fit: BoxFit.fill,
      ),
    ));
  }

//关注用户头像
  Widget homeTitleItemView(BuildContext context, int index) {
    UserItemData model = this._user_purse_items[index];
    return new Container(
      child: new GestureDetector(
        child: new Column(
          children: <Widget>[
            new Container(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(screenUtils.setWidgetWidth(24)),
                child: FadeInImage.assetNetwork(
                  placeholder: "assert/imgs/loading.gif",
                  image: "${model.avatar}",
                  fit: BoxFit.cover,
                  width: screenUtils.setWidgetWidth(48),
                  height: screenUtils.setWidgetHeight(48),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(screenUtils.setWidgetHeight(52))),
                border: new Border.all(width: 4, color: Color(0xff4ddfa9)),
              ),
            ),
            new Container(
              width: screenUtils.setWidgetWidth(50),
              alignment: Alignment.center,
              child: new Text(
                "${model.nickname}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff000000)),
              ),
            ),
          ],
        ),
        onTap: () {},
      ),
      margin: EdgeInsets.all(10),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
