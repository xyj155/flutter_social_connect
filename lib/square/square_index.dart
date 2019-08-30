import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(
    new MaterialApp(
      title: '',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SquarePageIndex(),
    ),
  );
}

class SquarePageIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.only(top: 16, left: 20, bottom: 20),
              child: new Text("广场",
                  style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              alignment: Alignment.topLeft,
            ),
            new Expanded(
                child: new Container(
              padding: new EdgeInsets.only(top: 16, right: 14, bottom: 14),
              child: new Image.asset(
                "assert/imgs/ic_square_add_user.png",
                width: 23,
                height: 23,
                alignment: Alignment.centerRight,
              ),
            ))
          ],
        ),
        new ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 42,
            color: Color(0xfff7f7f7),
            padding: EdgeInsets.only(left: 15),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: new Row(
              children: <Widget>[
                new Image.asset(
                  "assert/imgs/ic_square_search.png",
                  width: 23,
                  height: 23,
                ),
                new Text(
                  "    搜索你想的帖子",
                  style: new TextStyle(
                    color: Color(0xffbfbfbf),
                  ),
                ),

              ],
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 14, right: 14, top: 10),
            width: MediaQuery.of(context).size.width,
            height: 150.0,
            child: Swiper(
              pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeSize: 11,
                size: 8,
                activeColor: Color(0xffffffff),
              )),
              itemBuilder: _swiperBuilder,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              autoplay: true,
              onTap: (index) => print('点击了第$index个'),
            )),
       new Container(
         padding:EdgeInsets.all(10) ,
         child:  new Row(
           children: <Widget>[
             new Expanded(
               child: new Column(

                 children: <Widget>[
                   new Image.asset("assert/imgs/project_comics_new.png",width: 55,height: 55,),
                   new Text("大家一起聊")
                 ],
               ),
             ),
             new Expanded(
                 child: new Column(
                   children: <Widget>[
                     new Image.asset("assert/imgs/project_fans_new.png",width: 55,height: 55,),
                     new Text("约Ta")
                   ],
                 )),
             new Expanded(
                 child: new Column(
                   children: <Widget>[
                     new Image.asset("assert/imgs/project_film_new.png",width: 55,height: 55,),
                     new Text("下课玩")
                   ],
                 )),
             new Expanded(
                 child: new Column(
                   children: <Widget>[
                     new Image.asset("assert/imgs/project_game_new.png",width: 55,height: 55,),
                     new Text("在线匹配")
                   ],
                 )),
           ],
         ),
       )
      ],
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (new ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        "https://img.zcool.cn/community/0147c55d1c0621a801207640161685.jpg@2o.jpg",
        fit: BoxFit.fill,
      ),
    ));
  }
}
