import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:like_this/api/Api.dart';
import 'package:like_this/common/picture_preview_dialog.dart';
import 'package:like_this/home/home_post_item_detail.dart';
import 'package:like_this/util/Base64.dart';
import 'package:like_this/util/HttpUtil.dart';

import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/gson/user_post_item_entity.dart';
import 'package:like_this/util/TransationUtil.dart';
import 'package:like_this/widget/Post_detail.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomePostPurse(),
  ));
}

class HomePostPurse extends StatefulWidget {
  @override
  _HomePostPurseState createState() => new _HomePostPurseState();
}

class _HomePostPurseState extends State<HomePostPurse> {
  int _count = 20;
  ScreenUtils screenUtil = new ScreenUtils();
  IjkMediaController controller;

  _HomePostPurseState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPurseDataList();
  }

  @override
  Widget build(BuildContext context) {
    screenUtil.initUtil(context);
    return new Container(
      margin: EdgeInsets.only(top: 55),
      child: EasyRefresh(
        header: ClassicalHeader(
            enableInfiniteRefresh: false,
            refreshText: "正在刷新...",
            refreshReadyText: "下拉我刷新哦！",
            refreshingText: "还在刷新哦！",
            refreshedText: "刷新好了哦！嘻嘻",
            refreshFailedText: "刷新失败了哦！",
            noMoreText: "没有数据了",
            infoText: "",
            bgColor: Colors.white,
            infoColor: Colors.white),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _count = 20;
            });
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _count += 20;
            });
          });
        },
        child: getBody(),
      ),
    );
  }

  int count = 1;
  List<UserPostItemData> userPostItem = List();

  getBody() {
    if (userPostItem.length != 0) {
      return ListView.builder(
          itemCount: userPostItem.length,
          itemBuilder: (BuildContext context, int position) {
            return setUserPostList(userPostItem[position]);
          });
    } else {
      // 加载菊花
      return CupertinoActivityIndicator();
    }
  }

  void getPurseDataList() async {
    var response = await HttpUtil.getInstance().get(Api.QUERY_POST_LIST,
        data: {"page": count, "userId": "1", "isUser": ""});
    var decode = json.decode(response.toString());
    var userPostItemEntity = UserPostItemEntity.fromJson(decode);

    setState(() {
      userPostItem = userPostItemEntity.data;
      print(userPostItem.length);
      for (var o in userPostItem) {
//        print(Base642Text.decodeBase64());
        var controller = IjkMediaController();
        controller.setNetworkDataSource(o.pictures[0]);
      }
    });
//    Widget _buildItem(BuildContext context, int index) {
//      return AspectRatio(
//        child: VideoItem(list[index]),
//        aspectRatio: 1280 / 500,
//      );
//    }
  }

  // ignore: missing_return
  setUserPostList(UserPostItemData index) {
    return new GestureDetector(
      child: new Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(
                      top: screenUtil.setWidgetHeight(20),
                      left: screenUtil.setWidgetWidth(20),
                      right: screenUtil.setWidgetWidth(6)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: FadeInImage.assetNetwork(
                      placeholder: "assert/imgs/loading.gif",
                      image: "${index.user.avatar}",
                      fit: BoxFit.cover,
                      width: 44,
                      height: 44,
                    ),
                  ),
                ),
                new Column(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(
                          top: screenUtil.setWidgetHeight(20),
                          right: screenUtil.setWidgetWidth(6)),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "${index.user.nickname}",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenUtil.setFontSize(15)),
                          ),
                          new Text(
                            "${index.timeDuration}",
                            style: new TextStyle(
                                fontSize: screenUtil.setFontSize(11),
                                color: Color(0xff9B9B9B)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            new Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: screenUtil.setFontSize(20),
                  right: screenUtil.setFontSize(20),
                  top: screenUtil.setFontSize(14),
                  bottom: screenUtil.setFontSize(10)),
              child: new Text(
                Base642Text.decodeBase64("${index.postContent}"),
                style: new TextStyle(
                  fontSize: screenUtil.setFontSize(17),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.left,
              ),
            ),
            new Container(
                child: index.postType == 1
                    ? new GridView.builder(
                        padding: EdgeInsets.only(
                            left: screenUtil.setWidgetWidth(20),
                            right: screenUtil.setWidgetWidth(20),
                            top: screenUtil.setWidgetHeight(8),
                            bottom: screenUtil.setWidgetHeight(8)),
                        physics: new NeverScrollableScrollPhysics(),
                        //增加
                        shrinkWrap: true,
                        //增加
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 6.0,
                          crossAxisSpacing: 6.0,
                        ),
                        itemCount: index.pictures.length,
                        itemBuilder: (BuildContext context, int indexs) {
                          return new GestureDetector(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FadeInImage.assetNetwork(
                                placeholder: "assert/imgs/loading.gif",
                                image: "${index.pictures[indexs]}" +
                                    "?x-oss-process=style/image_press",
                                fit: BoxFit.cover,
                                width: 54,
                                height: 54,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhotoGalleryPage(
                                          index: indexs,
                                          photoList: index.pictures,
                                        )),
                              );
                            },
                          );
                        },
                      )
                    : new Container(
                        padding: EdgeInsets.only(
                            left: screenUtil.setWidgetHeight(20)),
                        alignment: Alignment.centerLeft,

                        child: DefaultIJKControllerWidget(
                          controller: controller,
                          verticalGesture: false,
                        ),
//                        child: new Stack(
//                          alignment: Alignment.center,
//                          children: <Widget>[
//                            ClipRRect(
//                              borderRadius: BorderRadius.circular(7),
//                              child: new FadeInImage.assetNetwork(
//                                alignment: Alignment.centerLeft,
//                                width: screenUtil.setWidgetHeight(230),
//                                placeholder: "assert/imgs/loading.gif",
//                                image: "${index.pictures[0]}" +
//                                    "?x-oss-process=video/snapshot,t_3000,f_jpg",
//                                fit: BoxFit.cover,
//                              ),
//                            ),
//                            new Image.asset(
//                              "assert/imgs/video_player.png",
//                              width: 45,
//                              height: 45,
//                            )
//                          ],
//                        ),
                      )),
            new Row(
              children: <Widget>[
                new UserPostDetailList(
                  title: "分享",
                  imagePath: "assert/imgs/person_share.png",
                ),
                new UserPostDetailList(
                  title: "评论",
                  imagePath: "assert/imgs/person_commentx.png",
                ),
                new UserPostDetailList(
                  title: "点赞",
                  imagePath: "assert/imgs/person_likex.png",
                ),
                new Expanded(
                    child: new Container(
                        child: new Image.asset(
                          "assert/imgs/post_more.png",
                          width: 24,
                          height: 21,
                        ),
                        alignment: Alignment.centerRight))
              ],
            ),
            new Container(
              height: screenUtil.setWidgetHeight(8),
              color: Color(0xfffafafa),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            CustomRouteSlide(UserPostDetailItemPage(userId: "${index.id}")));
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
