import 'package:flutter/services.dart';

extension FunctionExt<T> on void Function() {
  void Function() get withVibration {
    return () {
      HapticFeedback.lightImpact();
      this();
    };
  }
}
