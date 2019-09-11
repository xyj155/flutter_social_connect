import 'package:flutter/material.dart';
class PostPicturePage extends StatefulWidget {
  @override
  _PostPicturePageState createState() => _PostPicturePageState();
}

class _PostPicturePageState extends State<PostPicturePage> with SingleTickerProviderStateMixin {
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
    return Container();
  }
}
