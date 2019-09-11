import 'package:flutter/material.dart';
class TextPostPage extends StatefulWidget {
  @override
  _TextPostPageState createState() => _TextPostPageState();
}

class _TextPostPageState extends State<TextPostPage> with SingleTickerProviderStateMixin {
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
