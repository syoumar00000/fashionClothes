import 'dart:collection';
import 'package:fashion/mockups/faq-mockup.dart';
import 'package:fashion/models/faq.dart';
import 'package:flutter/material.dart';

class FaqProvider extends ChangeNotifier {
  List<Faq> _faqs = [];

  UnmodifiableListView<Faq> get faqs => UnmodifiableListView(_faqs);

  getAll() {
    _faqs.addAll(faqMockup);
    notifyListeners();
  }
}
