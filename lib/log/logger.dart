import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';

void printF(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}

void debugPrintF(String log) {
  if (kDebugMode) debugPrint(log);
}

void debugPrintStackF({
  StackTrace? stackTrace,
  String? label,
  int? maxFrames,
}) {
  if (kDebugMode) {
    debugPrintStack(stackTrace: stackTrace, label: label, maxFrames: maxFrames);
  }
}

void logg(
  String message, {
  DateTime? time,
  int? sequenceNumber,
  int level = 0,
  String name = '',
  Zone? zone,
  Object? error,
  StackTrace? stackTrace,
}) {
  log(
    message,
    time: time,
    sequenceNumber: sequenceNumber,
    level: level,
    // name: name,
    zone: zone,
    error: error,
    stackTrace: stackTrace,
  );
}
