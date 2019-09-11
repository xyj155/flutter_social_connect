import 'package:flutter/material.dart';
class PostVideoPage extends StatefulWidget {
  @override
  _PostVideoPageState createState() => _PostVideoPageState();
}

class _PostVideoPageState extends State<PostVideoPage> with SingleTickerProviderStateMixin {
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
