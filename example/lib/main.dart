import 'package:flutter/material.dart';
import 'package:nex_common_logs/nex_common_logs.dart';

void main() {
  AppLogs.settings(true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nex_common_logs Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('nex_common_logs Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                this.logMessage(text: 'This is a simple log message');
              },
              child: Text('Log Message'),
            ),
            ElevatedButton(
              onPressed: () {
                this.logError('This is an error log message',
                    error: 'Error details here');
              },
              child: Text('Log Error'),
            ),
            ElevatedButton(
              onPressed: () {
                this.logWarning('This is a warning log message',
                    error: 'Warning details here');
              },
              child: Text('Log Warning'),
            ),
            ElevatedButton(
              onPressed: () {
                this.logSuccess(text: 'This is a success log message');
              },
              child: Text('Log Success'),
            ),
          ],
        ),
      ),
    );
  }
}
