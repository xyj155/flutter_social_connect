import 'package:flutter/material.dart';
import 'package:like_this/widget/my_bottom_navigationbar.dart';
import 'home/home_index.dart';
import 'message/message_index.dart';
import 'square/square_index.dart';
import 'user/user_index.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(child: new MainPageWidget()),
    );
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPageWidget> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['动态', '广场', '', '消息', '我的'];

  /*
   * 存放三个页面，跟fragmentList一样
   */
  var _pageList;

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff12dab6)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 27.0, height: 27.0);
  }

  void initData() {

    tabImages = [
      [
        getTabImage('assert/imgs/tapbar_home_selected.png'),
        getTabImage('assert/imgs/tabbar_home_normal.png')
      ],
      [
        getTabImage('assert/imgs/tabbar_project_normal.png'),
        getTabImage('assert/imgs/tabbar_project_selected.png')
      ],
      [
        getTabImage('assert/imgs/ic_main_tab_attention.png'),
        getTabImage('assert/imgs/ic_main_tab_attention_pressed.png')
      ],

      [
        getTabImage('assert/imgs/tabbar_message_normal.png'),
        getTabImage('assert/imgs/tabbar_message_selected.png')
      ],
      [
        getTabImage('assert/imgs/tabbar_person_normal.png'),
        getTabImage('assert/imgs/tabbar_person_selected.png')
      ]
    ];
    /*
     * 三个子界面
     */
    _pageList = [
      new HomePage(),
      new SquarePageIndex(),
      new Container(),
      new MessagePageIndex(),
      new UserPageIndex(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //初始化数据
    initData();
    return Scaffold(
      body: _pageList[_tabIndex] ,
      bottomNavigationBar: new MyBottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: getTabIcon(0), title: getTabTitle(0)),
          new BottomNavigationBarItem(
              icon: getTabIcon(1), title: getTabTitle(1)),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add),
              title: Text('发布',style: new TextStyle(color: Color(0xff515151)),)),
          new BottomNavigationBarItem(
              icon: getTabIcon(3), title: getTabTitle(3)),
          new BottomNavigationBarItem(
              icon: getTabIcon(4), title: getTabTitle(4)),
        ],


        //默认选中首页
        currentIndex: _tabIndex,
        iconSize: 24.0,
        //点击事件
        onTap: (index) {
          if(index==2){// tab添加被点击

            return;
          }else{
            setState(() {
//            print(index);
              _tabIndex= index;
            });
          }

        },
      ),
      floatingActionButton: FloatingActionButtonDemo(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void initState() {
    super.initState();
//    listModel = new ListModel(_listKey, tasks);
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  const FloatingActionButtonDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.white,
      ),
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(0xff4ddfa9),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }
}
