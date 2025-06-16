import 'package:flutter/material.dart';

final homeKey = GlobalKey();
final projectKey  = GlobalKey();
final experienceKey = GlobalKey();
final skillKey = GlobalKey();
final contactKey = GlobalKey();
final hireMeKey = GlobalKey();

void scrollTo(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
