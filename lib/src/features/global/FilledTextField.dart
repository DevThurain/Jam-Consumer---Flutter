import 'package:flutter/material.dart';
import 'package:jams/src/core/constants/app_color.dart';
import 'package:jams/src/core/constants/app_dimen.dart';

class FilledTextField extends StatefulWidget {
  final Color filledColor;
  final String hintText;
  final String? fontFamily;
  final int maxLines;
  final bool enable;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final Function onImeAction;
  final EdgeInsets padding;
  final double radius;
  final Icon? icon;

  FilledTextField({
    Key? key,
    this.filledColor = Colors.white,
    this.fontFamily,
    this.maxLines = 1,
    this.enable = true,
    this.textInputAction = TextInputAction.next,
    this.hintText = "",
    this.padding = const EdgeInsets.fromLTRB(12, 24, 12, 16),
    this.radius = AppDimen.MARGIN_MEDIUM_2,
    this.icon,
    required this.onChanged,
    required this.onImeAction,
  }) : super(key: key);

  @override
  State<FilledTextField> createState() => _FilledTextFieldState();
}

class _FilledTextFieldState extends State<FilledTextField> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      enabled: widget.enable,
      textInputAction: widget.textInputAction,
      onSubmitted: (value) {
        widget.onImeAction();
      },
      style: TextStyle(fontFamily: widget.fontFamily, decoration: TextDecoration.none),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius), borderSide: BorderSide.none),
          contentPadding: widget.padding,
          prefixIcon: widget.icon,
          filled: true,
          fillColor: widget.filledColor,
          hintText: widget.hintText),
    );
  }
}
