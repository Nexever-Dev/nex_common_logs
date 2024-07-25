import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:nex_common_logs/nex_common_logs.dart';
import '../logcolor/log_color.dart';

/// A utility class for logging messages with different severity levels.
class AppLogs {
  AppLogs._();
  static AppLogs get instance => AppLogs._();
  factory AppLogs() => instance;

  bool enabled = true;

  static settings(bool enabled) {
    AppLogs().enabled = enabled;
    log('AppLogs is ${enabled ? 'enabled' : 'disabled'}');
  }

  /// Converts a given [color] to its value representation.
  /// If [color] is null, it returns the value of [defaultColor].
  ///
  /// Parameters:
  /// - [color] (`LogColors?`): The color to convert. If null, [defaultColor] is used.
  /// - [defaultColor] (`LogColors`): The default color to use if [color] is null.
  ///
  /// Returns:
  /// - (`String`): The color value as a string.
  static String colorTo(LogColors? color,
      [LogColors defaultColor = LogColors.magenta]) {
    return color?.value ?? defaultColor.value;
  }

  /// A list of screen names for which logs should be printed.
  /// If this list is not empty, only logs for the specified screens will be printed.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.screens = ['home', 'settings'];
  /// ```
  static List<String> screens = [];

  /// A flag indicating whether logging is enabled or not.
  /// If true, no log messages will be printed.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.printHandle = true;
  /// ```
  static bool printHandle = false;

  /// Logs a message with the specified [text] and optional [name].
  ///
  /// This method handles logging of messages with optional color formatting for the text and file name.
  /// It respects the [printHandle] flag and only logs messages if certain conditions are met.
  ///
  /// Parameters:
  /// - [text] (`String`): The message to log.
  /// - [name] (`String?`): The name of the file to include in the log message. This parameter is optional.
  /// - [msgColor] (`LogColors?`): The color to use for the main log message. If not provided, the default color is magenta.
  /// - [textColor] (`LogColors?`): The color to use for the text part of the log message. If not provided, the default color is white.
  /// - [fileNameColor] (`LogColors?`): The color to use for the file name part of the log message. If not provided, the default color is white.
  ///
  /// Returns:
  /// - (`void`): This method does not return a value.
  ///
  /// Notes:
  /// - If [printHandle] is true, no logging will occur.
  /// - If [AppLogs.screens] is not empty and [name] is not included in [AppLogs.screens], logging will not occur.
  /// - The method will print the log message and file name with specified or default colors.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.logMessage(
  ///   "This is a log message.",
  ///   name: "example.dart",
  ///   msgColor: LogColors.green,
  ///   textColor: LogColors.blue,
  ///   fileNameColor: LogColors.yellow,
  /// );
  /// ```
  static void logMessage(
    String? text, {
    String? name,
    LogColors? msgColor,
    LogColors? textColor,
    LogColors? fileNameColor,
  }) {
    if (printHandle) {
      return;
    }
    if (AppLogs.screens.isNotEmpty) {
      if (!AppLogs.screens.contains(name)) {
        return;
      }
    }
    if (kDebugMode) {
      print(
          "[${msgColor?.value ?? (name != null ? (fileNameColor?.value ?? LogColors.magenta.value) : LogColors.magenta.value)} ${name ?? 'LOG MESSAGE'} ${LogColors.reset.value}] "
          "${colorTo(msgColor, LogColors.white)} $text ${LogColors.reset.value}");
    }
  }

  /// Logs an error message with the specified [error], [text], [name], and [stackTrace].
  ///
  /// This method handles logging of error messages with optional color formatting for the text, error message,
  /// file name, and stack trace. It respects the [printHandle] flag and only logs messages if certain conditions are met.
  ///
  /// Parameters:
  /// - [text] (`String`): The additional information or message to log.
  /// - [name] (`String?`): The name of the file to include in the log message. This parameter is optional.
  /// - [error] (`String?`): The error message to log. This parameter is optional.
  /// - [stackTrace] (`StackTrace?`): The stack trace associated with the error. This parameter is optional.
  /// - [msgColor] (`LogColors?`): The color to use for the main log message. If not provided, the default color is magenta.
  /// - [textColor] (`LogColors?`): The color to use for the text part of the log message. If not provided, the default color is yellow.
  /// - [fileNameColor] (`LogColors?`): The color to use for the file name part of the log message. If not provided, the default color is blue.
  /// - [errorColor] (`LogColors?`): The color to use for the error message part of the log message. If not provided, the default color is yellow.
  /// - [stackTraceColor] (`LogColors?`): The color to use for the stack trace part of the log message. If not provided, the default color is yellow.
  ///
  /// Returns:
  /// - (`void`): This method does not return a value.
  ///
  /// Notes:
  /// - If [printHandle] is true, no logging will occur.
  /// - If [AppLogs.screens] is not empty and [name] is not included in [AppLogs.screens], logging will not occur.
  /// - The method will print the log message, error message, file name, and stack trace with specified or default colors.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.logError(
  ///   "This is additional information.",
  ///   name: "example.dart",
  ///   error: "An unexpected error occurred.",
  ///   stackTrace: StackTrace.current,
  ///   msgColor: LogColors.red,
  ///   textColor: LogColors.blue,
  ///   fileNameColor: LogColors.green,
  ///   errorColor: LogColors.yellow,
  ///   stackTraceColor: LogColors.cyan,
  /// );
  /// ```
  static void logError(
    String? text, {
    String? name,
    String? error,
    StackTrace? stackTrace,
    LogColors? msgColor,
    LogColors? textColor,
    LogColors? fileNameColor,
    LogColors? errorColor,
    LogColors? stackTraceColor,
  }) {
    if (printHandle) {
      return;
    }
    if (AppLogs.screens.isNotEmpty) {
      if (!AppLogs.screens.contains(name)) {
        return;
      }
    }
    if (kDebugMode) {
      print(
        "[${msgColor?.value ?? (name != null ? (fileNameColor?.value ?? LogColors.magenta.value) : LogColors.magenta.value)} ${name ?? 'LOG MESSAGE'} ${LogColors.reset.value}] ${textColor?.value ?? (name != null ? LogColors.white.value : LogColors.yellow.value)} $text ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG ERROR MESSAGE ${LogColors.reset.value}] ${errorColor?.value ?? LogColors.red.value} ${error.toString()} ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG STACKTRACE MESSAGE ${LogColors.reset.value}] ${stackTraceColor?.value ?? LogColors.yellow.value} ${stackTrace.toString()} ${LogColors.reset.value}",
      );
    }
  }

  /// Logs a warning message with the specified [text], [name], [error], and [stackTrace].
  ///
  /// This method handles logging of warning messages with optional color formatting for the text, warning message,
  /// file name, and stack trace. It respects the [printHandle] flag and only logs messages if certain conditions are met.
  ///
  /// Parameters:
  /// - [text] (`String`): The warning message or additional information to log.
  /// - [name] (`String?`): The name of the file to include in the log message. This parameter is optional.
  /// - [error] (`String?`): The warning error message to log. This parameter is optional.
  /// - [stackTrace] (`StackTrace?`): The stack trace associated with the warning. This parameter is optional.
  /// - [msgColor] (`LogColors?`): The color to use for the main log message. If not provided, the default color is magenta.
  /// - [textColor] (`LogColors?`): The color to use for the text part of the log message. If not provided, the default color is yellow.
  /// - [fileNameColor] (`LogColors?`): The color to use for the file name part of the log message. If not provided, the default color is blue.
  /// - [warningColor] (`LogColors?`): The color to use for the warning message part of the log message. If not provided, the default color is yellow.
  /// - [stackTraceColor] (`LogColors?`): The color to use for the stack trace part of the log message. If not provided, the default color is yellow.
  ///
  /// Returns:
  /// - (`void`): This method does not return a value.
  ///
  /// Notes:
  /// - If [printHandle] is true, no logging will occur.
  /// - If [AppLogs.screens] is not empty and [name] is not included in [AppLogs.screens], logging will not occur.
  /// - The method will print the log message, warning message, file name, and stack trace with specified or default colors.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.logWarning(
  ///   "This is a warning message.",
  ///   name: "example.dart",
  ///   error: "Warning occurred.",
  ///   stackTrace: StackTrace.current,
  ///   msgColor: LogColors.orange,
  ///   textColor: LogColors.blue,
  ///   fileNameColor: LogColors.green,
  ///   warningColor: LogColors.yellow,
  ///   stackTraceColor: LogColors.cyan,
  /// );
  /// ```
  static void logWarning(
    String? text, {
    String? name,
    String? error,
    StackTrace? stackTrace,
    LogColors? msgColor,
    LogColors? textColor,
    LogColors? fileNameColor,
    LogColors? warningColor,
    LogColors? stackTraceColor,
  }) {
    if (printHandle) {
      return;
    }
    if (AppLogs.screens.isNotEmpty) {
      if (!AppLogs.screens.contains(name)) {
        return;
      }
    }
    if (kDebugMode) {
      print(
        "[${msgColor?.value ?? (name != null ? (fileNameColor?.value ?? LogColors.magenta.value) : LogColors.magenta.value)} ${name ?? 'LOG MESSAGE'} ${LogColors.reset.value}] ${textColor?.value ?? (name != null ? LogColors.white.value : LogColors.yellow.value)} $text ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG WARNING MESSAGE ${LogColors.reset.value}] ${warningColor?.value ?? LogColors.yellow.value} ${error.toString()} ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG STACKTRACE MESSAGE ${LogColors.reset.value}] ${stackTraceColor?.value ?? LogColors.yellow.value} ${stackTrace.toString()} ${LogColors.reset.value}",
      );
    }
  }

  /// Logs a success message with the specified [text] and [name].
  ///
  /// This method handles logging of success messages with optional color formatting for the text and file name.
  /// It respects the [printHandle] flag and only logs messages if certain conditions are met.
  ///
  /// Parameters:
  /// - [name] (`String?`): The name of the file to include in the log message. This parameter is optional.
  /// - [text] (`String?`): The text of the log message. This parameter is optional.
  /// - [msgColor] (`LogColors?`): The color to use for the main log message. If not provided, the default color is magenta.
  /// - [textColor] (`LogColors?`): The color to use for the text part of the log message. If not provided, the default color is green.
  /// - [fileNameColor] (`LogColors?`): The color to use for the file name part of the log message. If not provided, the default color is blue.
  ///
  /// The method will:
  /// - Return immediately if [printHandle] is true, meaning no logging will occur.
  /// - Check if [AppLogs.screens] is not empty and if [name] is not included in [AppLogs.screens], it will return without logging.
  /// - Print the log message and file name with specified or default colors.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.logSuccess(
  ///   name: "example.dart",
  ///   text: "Operation completed successfully.",
  ///   msgColor: LogColors.magenta,
  ///   textColor: LogColors.green,
  ///   fileNameColor: LogColors.blue,
  /// );
  /// ```
  ///
  /// This will print:
  /// ```
  /// [35 LOG MESSAGE 0] 32 Operation completed successfully. 0
  /// [35 LOG FILE NAME MESSAGE 0] 34 example.dart 0
  /// ```
  /// Where `35` represents the color code for magenta, `32` for green, `34` for blue, and `0` for reset.
  ///
  /// Notes:
  /// - The [LogColors] enum should be predefined with appropriate color codes for use in log messages.
  /// - The [printHandle] variable should be a boolean value indicating whether to handle print operations.
  /// - The [AppLogs.screens] should be a collection (e.g., a list) that may contain specific file names to be included in the logs.
  static void logSuccess(
    String? text, {
    String? name,
    LogColors? msgColor,
    LogColors? textColor,
    LogColors? fileNameColor,
  }) {
    if (printHandle) {
      return;
    }
    if (AppLogs.screens.isNotEmpty) {
      if (!AppLogs.screens.contains(name)) {
        return;
      }
    }
    if (kDebugMode) {
      print(
        "[${msgColor?.value ?? (name != null ? (fileNameColor?.value ?? LogColors.magenta.value) : LogColors.magenta.value)} ${name ?? 'LOG MESSAGE'} ${LogColors.reset.value}] ${textColor?.value ?? (name != null ? LogColors.white.value : LogColors.green.value)} $text ${LogColors.reset.value}",
      );
    }
  }
}

/// An extension on [Object] to add logging methods for convenience.
extension ErrorLogs on Object {
  /// Logs a message with the specified [text] and [fileName].
  ///
  /// The log message is associated with the runtime type of the object.
  void logMessage({String? text, String? name}) {
    AppLogs.logMessage(text, name: name??runtimeType.toString());
  }

  /// Logs an error with the specified [error], [text], [stackTrace], and [fileName].
  ///
  /// The error message is associated with the runtime type of the object.
  void logError(
    String? text, {
    String? error,
    StackTrace? stackTrace,
    String? name,
  }) {
    AppLogs.logError(
      text,
      name: name??runtimeType.toString(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Logs a success message with the specified [text] and [fileName].
  ///
  /// The success message is associated with the runtime type of the object.
  void logSuccess(String? text, {String? fileName}) {
    AppLogs.logMessage(text, name: fileName??runtimeType.toString());
  }

  /// Logs a warning with the specified [error], [text], [stackTrace], and [fileName].
  ///
  /// The warning message is associated with the runtime type of the object.
  void logWarning(
    String? text, {
    String? error,
    StackTrace? stackTrace,
    String? name,
  }) {
    AppLogs.logWarning(
      text,
      name: name??runtimeType.toString(),
      error: error,
      stackTrace: stackTrace,
    );
  }
}
