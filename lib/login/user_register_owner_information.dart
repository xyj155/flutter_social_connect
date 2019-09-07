import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:like_this/util/ScreenUtils.dart';
import 'package:like_this/util/TransationUtil.dart';
import 'package:like_this/widget/input_text_fied.dart';

class UserRegisterInformationPage extends StatefulWidget {
  @override
  _UserRegisterInformationPageState createState() =>
      _UserRegisterInformationPageState();
}

class _UserRegisterInformationPageState
    extends State<UserRegisterInformationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    loadDate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ScreenUtils screenUtil = new ScreenUtils();

  List<PickerItem> list = new List();
  String startYear = "请选择你的入学年份";
  var data = ['2019年', '2018年', '2017年', '2016年', '2015年', '2014年', '2013年'];

  void loadDate() {
    for (int i = 0; i < data.length; i++) {
      list.add(new PickerItem(text: new Text(data[i]), value: data[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    screenUtil.initUtil(context);
    return new Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: new Column(
        children: <Widget>[
          new Text("基本信息",
              style: new TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xff000000),
                  fontSize: screenUtil.setWidgetWidth(29),
                  fontWeight: FontWeight.bold)),
          new Container(
            child: new Text("填写你的基本信息，让周围的人更想认识你",
                style: new TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: screenUtil.setWidgetWidth(14),
                    color: Color(0xffb6b6b6))),
            padding: EdgeInsets.only(
                top: screenUtil.setWidgetWidth(10),
                bottom: screenUtil.setWidgetWidth(30)),
          ),
          new Container(
            color: Color(0xfff8f8f8),
            alignment: Alignment.center,
            height: screenUtil.setWidgetHeight(55),
            margin: EdgeInsets.only(top: screenUtil.setWidgetHeight(16)),
            child: new ITextField(
                contentHeight: screenUtil.setWidgetHeight(15),
                keyboardType: ITextInputType.number,
                hintText: '请输入你的院校',
                deleteIcon: new Image.asset(
                  "assert/imgs/icon_image_delete.png",
                  width: screenUtil.setWidgetWidth(18),
                  height: screenUtil.setWidgetHeight(55),
                ),
                textStyle: TextStyle(
                    color: Colors.black, fontSize: screenUtil.setFontSize(15)),
                inputBorder: InputBorder.none,
                fieldCallBack: (content) {}),
          ),
          new Container(
            color: Color(0xfff8f8f8),
            alignment: Alignment.center,
            height: screenUtil.setWidgetHeight(55),
            margin: EdgeInsets.only(top: screenUtil.setWidgetHeight(16)),
            child: new ITextField(
                contentHeight: screenUtil.setWidgetHeight(15),
                keyboardType: ITextInputType.number,
                hintText: '请输入你的所在专业',
                deleteIcon: new Image.asset(
                  "assert/imgs/icon_image_delete.png",
                  width: screenUtil.setWidgetWidth(18),
                  height: screenUtil.setWidgetHeight(55),
                ),
                textStyle: TextStyle(
                    color: Colors.black, fontSize: screenUtil.setFontSize(15)),
                inputBorder: InputBorder.none,
                fieldCallBack: (content) {}),
          ),
          new GestureDetector(
            child: new Container(
              color: Color(0xfff8f8f8),
              padding: EdgeInsets.only(left: screenUtil.setWidgetWidth(15)),
              alignment: Alignment.centerLeft,
              height: screenUtil.setWidgetHeight(55),
              margin: EdgeInsets.only(top: screenUtil.setWidgetHeight(16)),
              child: new Text(
                startYear,
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: screenUtil.setFontSize(16),
                    color: Color(0xff8a8a8a),
                    decoration: TextDecoration.none),
              ),
            ),
            onTap: () {
              Picker picker = new Picker(
                  textStyle: new TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: screenUtil.setFontSize(12)),
                  itemExtent: screenUtil.setWidgetHeight(31),
                  adapter: PickerDataAdapter(
                    data: list,
                  ),
                  height: screenUtil.setWidgetHeight(210),
                  changeToFirst: true,
                  cancelText: "取消",
                  confirmText: "确定",
                  cancelTextStyle: new TextStyle(
                      color: Color(0xffbfbfbf),
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  confirmTextStyle: new TextStyle(
                      color: Color(0xff19bebf),
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                  columnPadding: const EdgeInsets.all(30.0),
                  onConfirm: (Picker picker, List value) {
                    this.setState(() {
                      startYear = "入学时间："+data[value[0]];
//                      countryCode = countryList[value[0]];
                    });
                  });
              picker.showModal(context);
            },
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            height: screenUtil.setWidgetHeight(50),
            margin: EdgeInsets.only(top: screenUtil.setWidgetHeight(16)),
            child: new MaterialButton(
              color: Color(0xff7c7f88),
              textColor: Colors.white,
              child: new Text(
                '登陆',
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    new CustomRouteSlide(new UserRegisterInformationPage()),
                        (route) => route == null);
              },
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      padding: EdgeInsets.only(
          left: screenUtil.setWidgetWidth(20),
          right: screenUtil.setWidgetWidth(20),
          top: screenUtil.setWidgetWidth(50)),
    );
  }
}
