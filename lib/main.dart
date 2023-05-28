import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruits_app/fruits_app.dart';
import 'package:logger/logger.dart';

void main() {
  runZonedGuarded(() {
    runApp(const FruitsApp());
  }, (error, stack) {
    Logger().e(stack.toString());
  });
}
