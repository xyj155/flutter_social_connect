import 'package:flutter/material.dart';
import 'package:like_this/util/CommonBack.dart';
class UserDetailCenterPage extends StatefulWidget {
  @override
  _UserDetailCenterPageState createState() => _UserDetailCenterPageState();
}

class _UserDetailCenterPageState extends State<UserDetailCenterPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackUtil.NavigationBack(context, "个人信息"),
    );
  }
}
