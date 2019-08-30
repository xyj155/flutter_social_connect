import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:like_this/api/Api.dart';
import 'package:like_this/gson/user_post_item_detail_entity.dart';

import 'package:like_this/util/Base64.dart';
import 'package:like_this/util/CommonBack.dart';
import 'package:like_this/util/HttpUtil.dart';
import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/widget/Post_detail.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;

// ignore: must_be_immutable
class UserPostDetailItemPage extends StatefulWidget {
  String userId;

  UserPostDetailItemPage({Key key, this.userId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePostDetailItemState();
  }
}

class _HomePostDetailItemState extends State<UserPostDetailItemPage> {
  ScreenUtils screenUtil = new ScreenUtils();
  UserPostItemDetailData userPostItem;
  IjkMediaController controller = IjkMediaController();

  void getPageData() async {
    var response = await HttpUtil.getInstance().get(Api.QUERY_POST_BY_POSTID,
        data: {"id": widget.userId, "userId": "1"});
    var decode = json.decode(response.toString());
    var userPostItemEntity = UserPostItemDetailEntity.fromJson(decode);
    setState(() {
      userPostItem = userPostItemEntity.data[0];
      var ijkplayer = IjkPlayer(
        mediaController: controller,
      );
      controller.setNetworkDataSource("${userPostItem.pictures[0]}");
      controller.play();
//      _videoPlayerController2 = ChewieController(
//          videoPlayerController:
//              VideoPlayerController.network("${userPostItem.pictures[0]}"),
//          autoPlay: true,
//          looping: false,
//          showControls: true,
//          aspectRatio:9/16
//         );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPageData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: BackUtil.NavigationBack(context, "帖子详情"),
      body: new Container(
        color: Colors.white,
        child: userPostItem == null
            ? new Container()
            : Column(
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
                            image: "${userPostItem.user.avatar}",
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
                                  "${userPostItem.user.nickname}",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenUtil.setFontSize(15)),
                                ),
                                new Text(
                                  "${userPostItem.timeDuration}",
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
                      Base642Text.decodeBase64("${userPostItem.postContent}"),
                      style: new TextStyle(
                        fontSize: screenUtil.setFontSize(17),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  new Container(
                      child: userPostItem.postType == 1
                          ? new GridView.builder(
                              padding: const EdgeInsets.all(20.0),
                              physics: new NeverScrollableScrollPhysics(),
                              //增加
                              shrinkWrap: true,
                              //增加
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                              ),
                              itemCount: userPostItem.pictures.length,
                              itemBuilder: (BuildContext context, int indexs) {
                                return FadeInImage.assetNetwork(
                                  placeholder: "assert/imgs/loading.gif",
                                  image: "${userPostItem.pictures[indexs]}",
                                  fit: BoxFit.cover,
                                  width: 44,
                                  height: 44,
                                );
                              },
                            )
                          : new Container(
                              padding: EdgeInsets.only(
                                  left: screenUtil.setWidgetWidth(20),
                                  right: screenUtil.setWidgetWidth(20)),
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
    );
  }

  @override
  void dispose() {
    controller.dispose();
//    _videoPlayerController2.dispose();
//    _videoPlayerController2.pause();
    super.dispose();
  }
}
