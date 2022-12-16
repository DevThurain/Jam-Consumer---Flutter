import 'package:flutter/material.dart';
import 'package:jams/src/core/constants/app_color.dart';
import 'package:jams/src/core/constants/app_dimen.dart';

class FilledPasswordTextField extends StatefulWidget {
  final Color filledColor;
  final String hintText;
  final String? fontFamily;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final Function onImeAction;
  final EdgeInsets padding;
  final double radius;
  final Icon? icon;

  FilledPasswordTextField({
    Key? key,
    this.filledColor = Colors.white,
    this.fontFamily,
    this.textInputAction = TextInputAction.next,
    this.hintText = "",
    this.padding = const EdgeInsets.fromLTRB(12, 24, 12, 16),
    this.radius = AppDimen.MARGIN_MEDIUM_2,
    this.icon,
    required this.onChanged,
    required this.onImeAction,
  }) : super(key: key);

  @override
  State<FilledPasswordTextField> createState() => _FilledPasswordTextFieldState();
}

class _FilledPasswordTextFieldState extends State<FilledPasswordTextField> {
  late TextEditingController textEditingController;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: hidePassword,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      onSubmitted: (value) {
        widget.onImeAction();
      },
      style: TextStyle(fontFamily: widget.fontFamily),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius), borderSide: BorderSide.none),
          contentPadding: widget.padding,
          filled: true,
          fillColor: widget.filledColor,
          prefixIcon: widget.icon,
          suffixIcon: IconButton(
            icon: hidePassword ? Icon(Icons.visibility_off,color: widget.icon?.color,) : Icon(Icons.visibility,color: widget.icon?.color,),
            splashRadius: 1,
            focusColor: AppColor.primaryColor,
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
          ),
          hintText: widget.hintText),
    );
  }
}
