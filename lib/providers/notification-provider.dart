import 'dart:collection';
import 'package:fashion/mockups/notifications-mockup.dart';
import 'package:flutter/material.dart';
import 'package:fashion/models/notification.dart' as AppNotification;

class NotificationProvider extends ChangeNotifier {
  List<AppNotification.Notification> _items = [];

  UnmodifiableListView<AppNotification.Notification> get items =>
      UnmodifiableListView(_items);

  //get all notifications
  getAll() async {
    _items = notificationMockup;
    notifyListeners();
    return _items;
  }
}
