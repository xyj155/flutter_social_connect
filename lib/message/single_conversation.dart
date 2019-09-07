import 'package:flutter/material.dart';

class SingleConversationPage extends StatefulWidget {
  final String userId;
  final String username;


  SingleConversationPage({Key key, @required this.userId, @required this.username}) : super(key: key);

  @override
  _SingleConversationPageState createState() => _SingleConversationPageState();
}

class _SingleConversationPageState extends State<SingleConversationPage>
    with SingleTickerProviderStateMixin {
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
