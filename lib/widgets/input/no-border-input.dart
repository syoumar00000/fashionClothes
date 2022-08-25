import 'package:flutter/material.dart';

class NoBorderInput extends StatelessWidget {
  final String? hint;
  final String? label;
  final int? lines;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final TextInputType? type;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final bool hidden;

  const NoBorderInput({
    Key? key,
    this.hint = "",
    this.label = "",
    this.lines = 1,
    this.controller,
    this.maxLength,
    this.suffix,
    this.prefix,
    this.padding,
    this.type,
    this.hidden = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: lines,
      maxLines: lines,
      maxLength: maxLength,
      controller: controller,
      obscureText: hidden,
      keyboardType: type,
      decoration: InputDecoration(
        contentPadding: padding,
        suffixIcon: suffix,
        prefixIcon: prefix,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        floatingLabelBehavior: label == null
            ? FloatingLabelBehavior.never
            : FloatingLabelBehavior.always,
        labelText: label ?? hint,
        alignLabelWithHint: true,
      ),
    );
  }
}
