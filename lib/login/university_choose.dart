import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:like_this/api/Api.dart';
import 'package:like_this/gson/university_entity.dart';
import 'package:like_this/util/CommonBack.dart';
import 'package:like_this/util/HttpUtil.dart';
import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/widget/input_text_fied.dart';

class SchoolChoosePage extends StatefulWidget {
  @override
  _SchoolChoosePageState createState() => _SchoolChoosePageState();
}

class _SchoolChoosePageState extends State<SchoolChoosePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ScreenUtils screenUtil = new ScreenUtils();

  @override
  Widget build(BuildContext context) {
    screenUtil.initUtil(context);
    return Scaffold(
        appBar: BackUtil.NavigationBack(context, "学校选择"),
        body: new Column(
          children: <Widget>[
            new Container(
              color: Colors.white,
              alignment: Alignment.center,
              height: screenUtil.setWidgetHeight(55),
              child: new ITextField(
                  contentHeight: screenUtil.setWidgetHeight(15),
                  keyboardType: ITextInputType.text,
                  hintText: '搜索你的院校',
                  deleteIcon: new Image.asset(
                    "assert/imgs/icon_image_delete.png",
                    width: screenUtil.setWidgetWidth(18),
                    height: screenUtil.setWidgetHeight(55),
                  ),
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: screenUtil.setFontSize(15)),
                  inputBorder: InputBorder.none,
                  fieldCallBack: (content) {
                      print(content);
                      getUniversityQuery(content);
                  }),
            ),
            new ListView.builder(
                shrinkWrap:true,
                itemCount: _list.length,
                itemBuilder: university,
                scrollDirection: Axis.vertical),
          ],
        ));
  }

  Widget university(BuildContext context, int index) {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.all(screenUtil.setWidgetWidth(11)),
        child: new Text(_list[index].school,
            style: new TextStyle(
                fontSize: screenUtil.setFontSize(16),
                decoration: TextDecoration.none,
                color: Colors.black)),
      ),
      onTap: (){
        Navigator.pop(context, _list[index].school);
      },
    );
  }

  List<UniversityData> _list = new List();

  getUniversityQuery(String content) async {
    if(content.isNotEmpty){
      var response = await HttpUtil.getInstance()
          .get(Api.UNIVERSITY_QUERY, data: {"school": content});
      var decode = json.decode(response);
      var shopKindListEntity = UniversityEntity.fromJson(decode);
      print(decode);
      if (shopKindListEntity.code == 200) {
        setState(() {
          _list = shopKindListEntity.data;
        });
      }
    }

  }
}
