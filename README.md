
![nexever logo](https://nexever.com/images/logo2.png)
# nex_common_logs

`nex_common_logs` is a Flutter package that provides a utility class for logging messages with different severity levels. It supports color formatting and various logging options to help you manage and display log messages efficiently.

## Features

- Log messages with different severity levels: info, warning, error, success.
- Customizable colors for log messages, file names, errors, and stack traces.
- Option to enable or disable logging and filter messages by screen name.
- Easy-to-use extension methods for quick logging.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  nex_common_logs: ^1.0.0
```

Run `flutter pub get` to install the package.

## Usage

### Importing the Package

```dart
import 'package:nex_common_logs/nex_common_logs.dart';
import '../logcolor/log_color.dart'; // Import your LogColors class if needed
```

### Logging Messages

You can log messages using the `AppLogs` class. Here's how to use each logging method:

#### Logging a Message

```dart
AppLogs.logMessage(
  "This is a log message.",
  name: "example.dart",
  msgColor: LogColors.green,
  textColor: LogColors.blue,
  fileNameColor: LogColors.yellow,
);
```

#### Logging an Error

```dart
AppLogs.logError(
  "This is additional information.",
  name: "example.dart",
  error: "An unexpected error occurred.",
  stackTrace: StackTrace.current,
  msgColor: LogColors.red,
  textColor: LogColors.blue,
  fileNameColor: LogColors.green,
  errorColor: LogColors.yellow,
  stackTraceColor: LogColors.cyan,
);
```

#### Logging a Warning

```dart
AppLogs.logWarning(
  "This is a warning message.",
  name: "example.dart",
  error: "Warning occurred.",
  stackTrace: StackTrace.current,
  msgColor: LogColors.orange,
  textColor: LogColors.blue,
  fileNameColor: LogColors.green,
  warningColor: LogColors.yellow,
  stackTraceColor: LogColors.cyan,
);
```

#### Logging a Success

```dart
AppLogs.logSuccess(
  text: "Operation completed successfully.",
  name: "example.dart",
  msgColor: LogColors.magenta,
  textColor: LogColors.green,
  fileNameColor: LogColors.blue,
);
```

### Customizing Logging Behavior

You can configure the logging behavior with the following options:

- **Enable/Disable Logging**

  ```dart
  AppLogs.settings(true); // Enable logging
  AppLogs.settings(false); // Disable logging
  ```

- **Filter by Screen Name**

  ```dart
  AppLogs.screens = ['home', 'settings'];
  ```

- **Enable/Disable Print Handle**

  ```dart
  AppLogs.printHandle = true; // Disable logging
  ```

### Extension Methods

The package also includes extension methods for logging:

```dart
// For any object
void someMethod() {
  this.logMessage(
    text: "Logging from extension",
    fileName: "example.dart",
  );
}
```

#### Error Logging Extension

```dart
void someMethod() {
  this.logError(
    "Error occurred",
    error: "Some error message",
    stackTrace: StackTrace.current,
    fileName: "example.dart",
  );
}
```

#### Success Logging Extension

```dart
void someMethod() {
  this.logSuccess(
    text: "Operation successful",
    fileName: "example.dart",
  );
}
```

#### Warning Logging Extension

```dart
void someMethod() {
  this.logWarning(
    "Warning message",
    error: "Warning details",
    stackTrace: StackTrace.current,
    fileName: "example.dart",
  );
}
```

## Contributing

Contributions are welcome! Please create an issue or pull request on GitHub.

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

```

This `README.md` file includes instructions for installation, usage examples, and configuration options for your package. You can adjust any parts of it according to your specific needs.




# nex_common_logs
# nex_common_logs
