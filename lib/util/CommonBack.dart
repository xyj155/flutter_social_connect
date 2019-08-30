import 'package:flutter/material.dart';

class BackUtil {
  static Widget NavigationBack(BuildContext context, String title) {
    return new AppBar(
      leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          }),
      elevation: 1,
      iconTheme: new IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: new Text(title,style:new TextStyle(color: Color(0xff000000))),
    );
  }
}
