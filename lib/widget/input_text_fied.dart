import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///自带删除的ITextField
typedef void ITextFieldCallBack(String content);

enum ITextInputType {
  text,
  multiline,
  number,
  phone,
  datetime,
  emailAddress,
  url,
  password
}

class ITextField extends StatefulWidget {
  final ITextInputType keyboardType;
  final int maxLines;
  final int maxLength;
  final String hintText;
  final TextStyle hintStyle;
  final ITextFieldCallBack fieldCallBack;
  final Image deleteIcon;
  final double contentHeight;
  final InputBorder inputBorder;
  final Widget prefixIcon;
  final TextStyle textStyle;
  final FormFieldValidator<String> validator;

  ITextField({
    Key key,
    ITextInputType keyboardType: ITextInputType.text,
    this.maxLines = 1,
    this.maxLength,
    this.hintText,
    this.hintStyle,
    this.contentHeight,
    this.fieldCallBack,
    this.deleteIcon,
    this.inputBorder,
    this.textStyle,
    this.prefixIcon,
    this.validator,
  })  : assert(maxLines == null || maxLines > 0),
        assert(maxLength == null || maxLength > 0),
        keyboardType = maxLines == 1 ? keyboardType : ITextInputType.multiline,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _ITextFieldState();
}

class _ITextFieldState extends State<ITextField> {
  String _inputText = "";
  bool _hasdeleteIcon = false;
  bool _isNumber = false;
  bool _isPassword = false;

  ///输入类型
  TextInputType _getTextInputType() {
    switch (widget.keyboardType) {
      case ITextInputType.text:
        return TextInputType.text;
      case ITextInputType.multiline:
        return TextInputType.multiline;
      case ITextInputType.number:
        _isNumber = true;
        return TextInputType.number;
      case ITextInputType.phone:
        _isNumber = true;
        return TextInputType.phone;
      case ITextInputType.datetime:
        return TextInputType.datetime;
      case ITextInputType.emailAddress:
        return TextInputType.emailAddress;
      case ITextInputType.url:
        return TextInputType.url;
      case ITextInputType.password:
        _isPassword = true;
        return TextInputType.text;
    }
  }

  ///输入范围
  List<TextInputFormatter> _getTextInputFormatter() {
    return _isNumber
        ? <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly,
          ]
        : null;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController.fromValue(
        TextEditingValue(
            text: _inputText,
            selection: new TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: _inputText.length))));
    TextField textField = new TextField(
      controller: _controller,
      decoration: InputDecoration(

        hintStyle: widget.hintStyle,
        counterStyle: TextStyle(color: Colors.white),
        hintText: widget.hintText,
        contentPadding: EdgeInsets.all(widget.contentHeight),
        border: widget.inputBorder != null
            ? widget.inputBorder
            : UnderlineInputBorder(),
        fillColor: Colors.transparent,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _hasdeleteIcon
            ? new Container(
                alignment: Alignment.center,
                width: 20.0,
                height: 20.0,
                child: new IconButton(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(0.0),
                  iconSize: 18.0,
                  icon: widget.deleteIcon != null
                      ? widget.deleteIcon
                      : Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      _inputText = "";
                      _hasdeleteIcon = (_inputText.isNotEmpty);
                      widget.fieldCallBack(_inputText);
                    });
                  },
                ),
              )
            : new Text(""),
      ),
      onChanged: (str) {
        setState(() {
          _inputText = str;
          _hasdeleteIcon = (_inputText.isNotEmpty);
          widget.fieldCallBack(_inputText);
        });
      },
      keyboardType: _getTextInputType(),

      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      inputFormatters: _getTextInputFormatter(),
      style: widget.textStyle,
      obscureText: _isPassword,
    );
    return  textField;
  }
}
