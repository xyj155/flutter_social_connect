import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:like_this/api/Api.dart';
import 'package:like_this/gson/home_user_topic_entity.dart';
import 'package:like_this/util/CommonBack.dart';
import 'package:like_this/util/HttpUtil.dart';

class UserTopicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeTopicPage();
  }
}

class HomeTopicPage extends State<StatefulWidget> {
  List<HomeUserTopicData> _datas = List(); //一级分类集合
  List<HomeUserTopicDataChild> articles = List(); //二级分类集合
  int index; //一级分类下标
  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      var response = await HttpUtil().get(Api.USER_TOPIC_LIST);
      Map userMap = json.decode(response.toString());
      print("================================-----------");
      print(response.toString());
      var naviEntity = HomeUserTopicEntity.fromJson(userMap);
      setState(() {
        _datas = naviEntity.data;
        index = 0;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: BackUtil.NavigationBack(context, "话题"),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                    itemCount: _datas.length,
                    itemBuilder: (BuildContext context, int position) {
                      return getRow(position);
                    }),
              )),
          Expanded(
              flex: 5,
              child: ListView(
                children: <Widget>[
                  Container(
                    //height: double.infinity,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: getChip(index), //传入一级分类下标
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        //Container下的color属性会与decoration下的border属性冲突，所以要用decoration下的color属性
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
                width: 5, color: index == i ? Color(0xff4ddfa9) : Colors.white),
          ),
        ),
        child: Text(_datas[i].topicName,
            style: TextStyle(
                color: Colors.black,
                fontWeight: index == i ? FontWeight.w600 : FontWeight.w400,
                fontSize: 16)),
      ),
      onTap: () {
        setState(() {
          index = i; //记录选中的下标
        });
      },
    );
  }

  Widget getChip(int i) {
    //更新对应下标数据
    _updateArticles(i);
    return new GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4.0,
      ),
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: FadeInImage.assetNetwork(
                placeholder: "assert/imgs/loading.gif",
                image: articles[index].topicPicUrl,
                fit: BoxFit.cover,
                width: 64,
                height: 64,
              ),
            ),
//            new Image.network(articles[index].topicPicUrl,width: 55,height: 55,),
            new Text(
              articles[index].topicName,
              style: new TextStyle(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        );
      },
    );
//    return Wrap(
//      spacing: 10.0,
//      direction: Axis.horizontal, //方向
//      alignment: WrapAlignment.start, //内容排序方式
//      children: List<Widget>.generate(
//        articles.length,
//        (int index) {
//          return Column(
//            children: <Widget>[
//              new Image.network(articles[index].topicPicUrl),
//              new Text(articles[index].topicName,style:new TextStyle(
//                color:Colors.black
//              ))
//            ],
//          );
//        },
//      ).toList(),
//    );
  }

  ///
  /// 根据一级分类下标更新二级分类集合
  ///
  List<HomeUserTopicDataChild> _updateArticles(int i) {
    setState(() {
      if (_datas.length != 0) articles = _datas[i].child;
    });
    return articles;
  }
}
