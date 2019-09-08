import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_this/api/Api.dart';
import 'package:like_this/home/home_post_local.dart';
import 'package:like_this/home/home_post_observe.dart';
import 'package:like_this/home/home_post_purse.dart';

import 'package:like_this/home/home_user_topic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_this/util/HttpUtil.dart';
import 'package:like_this/gson/home_title_avatar_entity.dart';

import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/util/TransationUtil.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageIndex();
  }
}

class HomePageIndex extends State<HomePage> with AutomaticKeepAliveClientMixin {
  var _items;
  ScreenUtils screenUtil = new ScreenUtils();
  final List<HomeTabList> myTabs = <HomeTabList>[
    new HomeTabList('推荐', new HomePostPurse()),
    new HomeTabList('附近', new HomePostLocal()),
    new HomeTabList('关注', new HomePostObserve())
  ];

  Widget _widget_menu_card(BuildContext contexts) {
    return new SliverToBoxAdapter(
      child: new Wrap(
        alignment: WrapAlignment.end,
        children: <Widget>[home_top_menu(contexts)],
      ),
    );
  }

  @override
  Widget build(BuildContext contexts) {
    screenUtil.initUtil(contexts);
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _widget_menu_card(contexts),
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: false,
                  pinned: true,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                  title: TabBar(
                    indicatorColor: Color(0xff4ddfa9),
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelStyle: new TextStyle(
                        fontSize: screenUtil.setFontSize(17),
                        fontWeight: FontWeight.bold),
                    labelStyle: new TextStyle(
                        fontSize: screenUtil.setFontSize(24),
                        fontWeight: FontWeight.bold),
                    labelColor: Colors.black,
                    unselectedLabelColor: Color(0xff707070),
                    indicatorWeight: screenUtil.setFontSize(5),
                    isScrollable: true,
                    tabs: myTabs.map((HomeTabList item) {
                      return new Tab(
                          text: item.text == null ? '错误' : item.text);
                    }).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: myTabs.map((item) {
              return item.goodList;
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getTitleAvatarData();
  }

  Widget home_top_menu(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 10),
      height: screenUtil.setWidgetHeight(116),
      child: _items == null
          ? CupertinoActivityIndicator()
          : new ListView.builder(
              itemCount: _items.length,
              itemBuilder: homeTitleItemView,
              scrollDirection: Axis.horizontal),
    );
  }

  getTitleAvatarData() async {
    var response = await HttpUtil().get(Api.HOME_TITLE_AVATAR);
    print('========================='+response);
    final body = json.decode(response.toString());
    var code = HomeTitleAvatarEntity.fromJson(body);
    if (body != null)
      setState(() {
        _items = code.data;
      });
  }

  //标题圆圈
  Widget homeTitleItemView(BuildContext context, int index) {
    HomeTitleAvatarData model = this._items[index];
    return new Container(
      child: new GestureDetector(
        child: new Column(
          children: <Widget>[
            new Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: FadeInImage.assetNetwork(
                  placeholder: "assert/imgs/loading.gif",
                  image: "${model.activePicture}",
                  fit: BoxFit.cover,
                  width: screenUtil.setWidgetWidth(56),
                  height: screenUtil.setWidgetHeight(56),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(screenUtil.setWidgetHeight(40))),
                border: new Border.all(width: 4, color: Color(0xff4ddfa9)),
              ),
            ),
            new Text(
              "${model.activeName}",
              style: new TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xff000000)),
            )
          ],
        ),
        onTap: () {
          _onListItemTap(context, index);
        },
      ),
      margin: EdgeInsets.all(10),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

void _onListItemTap(
  BuildContext context,
  int index,
) {
  if (index == 0) {
    Navigator.push(context, CustomRouteSlide(UserTopicPage()));
  }
}

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar widget;
  final Color color;

  const SliverTabBarDelegate(this.widget, {this.color})
      : assert(widget != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: widget,
      color: color,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => widget.preferredSize.height;

  @override
  double get minExtent => widget.preferredSize.height;
}

class HomeTabList {
  String text;
  Widget goodList;

  HomeTabList(this.text, this.goodList);
}
