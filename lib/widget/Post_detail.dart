import 'package:flutter/material.dart';

class UserPostDetailList extends StatefulWidget {
  const UserPostDetailList({
    Key key,
    this.title,
    this.imagePath,
  }) : super(key: key);

  final String title;
  final String imagePath;

  _BoardState createState() => new _BoardState();
}

class _BoardState extends State<UserPostDetailList> {
  double _size = 1.0;

  void grow() {
    setState(() {
      _size += 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 15,bottom: 15,left: 8,right: 8),
      child: new Row(
        children: <Widget>[
          new Image.asset(widget.imagePath,width: 24,height: 21,),
          new Text(widget.title,style: new TextStyle(color: Color(0xffbcbfc3)),),
        ],
      ),
    );
  }
}
