import 'package:flutter/material.dart';

class Notification {
  final String content;
  final bool read;
  final String title;
  final DateTime? date;
  final String type;

  Notification(
      {this.date,
      this.content = "",
      this.read = false,
      this.title = "",
      this.type = ""});
}

final Map<String, Color> notificationColors = {
  "success": Colors.green,
  "warning": Colors.red,
  "": Colors.transparent
};
