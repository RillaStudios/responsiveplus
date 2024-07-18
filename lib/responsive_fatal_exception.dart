import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

class ResponsiveFatalException implements Exception {
  final String message;

  ResponsiveFatalException(this.message) {
    closeApp();
  }

  @override
  String toString() {
    return 'ResponsiveFatalException: $message';
  }

  void closeApp() {
    if (kIsWeb) {
      web.window.close();
    } else {
      exit(0);
    }
  }
}
