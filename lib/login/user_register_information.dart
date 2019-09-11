import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_luban/flutter_luban.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class UserAvatarRegisterPage extends StatefulWidget {
  @override
  _UserAvatarRegisterPageState createState() => _UserAvatarRegisterPageState();
}

class _UserAvatarRegisterPageState extends State<UserAvatarRegisterPage>
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

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    setState(() {
      CompressObject compressObject = CompressObject(imageFile: image,path: documentsPath);
      Luban.compressImage(compressObject).then((_path) {
        setState(() {
          print("------------------------------");
          print(_path);
          print("------------------------------");
        });
      });
//      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getImage();
      },
    );
  }
}
