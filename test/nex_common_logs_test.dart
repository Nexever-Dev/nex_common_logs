import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nex_common_logs/logcolor/log_color.dart';
import 'package:nex_common_logs/log/app_logs.dart';

void main() {
  test('adds one to input values', () {
    print(
        "[${LogColors.magenta.value} LOG MESSAGE ${LogColors.reset.value}] ${LogColors.yellow.value} SIMPLE MESSAGE PRINT ${LogColors.reset.value}");
    AppLogs.logMessage('SIMPLE MESSAGE',
        name: 'TEST CASE', msgColor: LogColors.backGroundCyan);
    AppLogs.logError(
         'SIMPLE ERROR MESSAGE', name: 'FILENAME', error: 'ERROR TEXT');
    AppLogs.logWarning(
         'SIMPLE ERROR MESSAGE', name: 'FILENAME', error: 'ERROR TEXT');
    AppLogs.logSuccess( 'SIMPLE MESSAGE', name: 'TEST CASE');
    "TESTING".logWarning('TEXT', fileName: 'FILE NAME', error: 'ERROR');
  });
}

class data extends StatefulWidget {
  const data({super.key});

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  @override
  void initState() {
    AppLogs.screens.add(runtimeType.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
