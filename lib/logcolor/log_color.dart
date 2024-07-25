/// Enum representing various colors for log messages.
enum LogColors {
  /// Resets the text color to the default.
  reset('\x1B[0m'),

  /// Sets the text color to red.
  red('\x1B[31m'),

  /// Sets the text color to green.
  green('\x1B[32m'),

  /// Sets the text color to yellow.
  yellow('\x1B[33m'),

  /// Sets the text color to blue.
  blue('\x1B[34m'),

  /// Sets the text color to magenta.
  magenta('\x1B[35m'),

  /// Sets the text color to cyan.
  cyan('\x1B[36m'),

  /// Sets the text color to white.
  white('\x1B[37m'),

  /// Sets the text color to black.
  black('\x1B[30m'),

  /// Sets the text color to bright red.
  brightRed('\x1B[91m'),

  /// Sets the text color to bright green.
  brightGreen('\x1B[92m'),

  /// Sets the text color to bright yellow.
  brightYellow('\x1B[93m'),

  /// Sets the text color to bright blue.
  brightBlue('\x1B[94m'),

  /// Sets the text color to bright magenta.
  brightMagenta('\x1B[95m'),

  /// Sets the text color to bright cyan.
  brightCyan('\x1B[96m'),

  /// Sets the text color to bright white.
  brightWhite('\x1B[97m'),

  /// Sets the text color to bright black.
  brightBlack('\x1B[90m'),

  /// Sets the text color to background black.
  backGroundRed('\x1B[41m'),

  /// Sets the text color to background black.
  backGroundGreen('\x1B[42m'),

  /// Sets the text color to background black.
  backGroundYellow('\x1B[43m'),

  /// Sets the text color to background black.
  backGroundBlue('\x1B[44m'),

  /// Sets the text color to background black.
  backGroundMagenta('\x1B[45m'),

  /// Sets the text color to background black.
  backGroundCyan('\x1B[46m'),

  /// Sets the text color to background black.
  backGroundBlack('\x1B[40m'),

  /// Sets the text color to bright background red.
  brightBackGroundRed('\x1B[101m'),

  /// Sets the text color to bright background green.
  brightBackGroundGreen('\x1B[102m'),

  /// Sets the text color to bright background yellow.
  brightBackGroundYellow('\x1B[103m'),

  /// Sets the text color to bright background blue.
  brightBackGroundBlue('\x1B[104m'),

  /// Sets the text color to bright background magenta.
  brightBackGroundMagenta('\x1B[105m'),

  /// Sets the text color to bright background cyan.
  brightBackGroundCyan('\x1B[106m'),

  /// Sets the text color to bright background black.
  brightBackGroundBlack('\x1B[100m');

  /// The escape sequence for the color.
  final String value;

  /// Constructs a LogColors enum member with the provided escape sequence.
  const LogColors(this.value);
}
