import 'package:flutter/material.dart';
import 'package:todo_app/utils/nav_utils.dart';

Future<void> showSnackbar(String message) async {
  clearAllSnackbar();
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

void clearAllSnackbar() {
  ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
}
