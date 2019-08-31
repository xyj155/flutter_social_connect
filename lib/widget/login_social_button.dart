import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_this/util/ScreenUtils.dart';

typedef void OnClickCallBack();

// ignore: must_be_immutable
class LoginSocialButton extends StatefulWidget {
  String title;
  Color bgColor;
  String icoPath;
  OnClickCallBack onClickCallBack;
  LoginSocialButton({
    Key key,
    this.title,
    this.bgColor,
    this.icoPath,
    this.onClickCallBack
  });

  @override
  State<StatefulWidget> createState() => LoginSocialState();


}

class LoginSocialState extends State<LoginSocialButton> {
  ScreenUtils screenUtil=new ScreenUtils();

  @override
  Widget build(BuildContext context) {
    screenUtil.initUtil(context);
    // TODO: implement build
    return new GestureDetector(
      child: new Container(
        margin: EdgeInsets.only(top: screenUtil.setWidgetHeight(13)),
        child: new Row(
          children: <Widget>[
            new Container(
              width:screenUtil.setWidgetWidth(48) ,
              height: screenUtil.setWidgetHeight(48),
              alignment: Alignment.center,
              color:widget.bgColor,
              child: new Image.asset(widget.icoPath,width:screenUtil.setWidgetWidth(24),height:screenUtil.setWidgetHeight(24),),
            ),new Container(
              width: 1,
              color: Colors.white,
            ),new Expanded(child: new Container(
              color:widget.bgColor,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: screenUtil.setWidgetWidth(18)),
              height:screenUtil.setWidgetHeight(48) ,
              child: new Text(widget.title,  style: new TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontWeight: FontWeight.normal)),
            ))
          ],
        ),
      ),
      onTap: (){
        setState(() {
          widget.onClickCallBack();
        });

      },
    );
  }

}