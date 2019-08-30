import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:like_this/widget/header/space_header.dart';
void main() {
  runApp(new MaterialApp(
    home: new HomePostLocal(),
  ));
}

class HomePostLocal extends StatefulWidget {
  @override
  _HomePostLocalState createState() => new _HomePostLocalState();
}

class _HomePostLocalState extends State<HomePostLocal> {
  int _count = 20;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        margin:EdgeInsets.only(top: 55) ,
        child: EasyRefresh.custom(
          header: SpaceHeader(),
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
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Container(

                  );
                },
                childCount: _count,
              ),
            ),
          ],
        ),
      ),
    );
  }
}