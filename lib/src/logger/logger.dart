// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:logger/logger.dart';

// 1. Custom Pretty Printer with Advanced Configuration
class CustomPrettyPrinter extends PrettyPrinter {
  CustomPrettyPrinter({
    int? methodCount,
    int? errorMethodCount,
    int? lineLength,
    bool? colors,
    bool? printEmojis,
  }) : super(
          methodCount: methodCount ?? 2,
          errorMethodCount: errorMethodCount ?? 8,
          lineLength: lineLength ?? 120,
          colors: colors ?? true,
          printEmojis: printEmojis ?? true,

          // Custom datetime format
          dateTimeFormat: (datetime) {
            return datetime.toIso8601String();
          },
          // Custom level colors
          levelColors: {
            Level.trace: AnsiColor.fg(AnsiColor.grey(0.5)),
            Level.debug: const AnsiColor.fg(12),
            Level.info: const AnsiColor.fg(81),
            Level.warning: const AnsiColor.fg(208),
            Level.error: const AnsiColor.fg(196),
            Level.fatal: const AnsiColor.fg(199),
          },
          // Custom level emojis
          levelEmojis: {
            Level.trace: '🔍 ',
            Level.debug: '🐛 ',
            Level.info: 'ℹ️ ',
            Level.warning: '⚠️ ',
            Level.error: '⛔ ',
            Level.fatal: '💀 ',
          },
        );
}

// 2. Custom Printer for Specific Format
class CustomLogPrinter extends LogPrinter {
  CustomLogPrinter({
    required this.className,
    this.printTime = true,
    this.colors = true,
  });

  final String className;
  final bool printTime;
  final bool colors;

  @override
  List<String> log(LogEvent event) {
    final color = colors ? _getLevelColor(event.level) : null;
    final emoji = _getLevelEmoji(event.level);
    final time = printTime ? DateTime.now().toString() : '';

    var messageString = event.message.toString();
    if (event.error != null) {
      messageString += '\nError: ${event.error}';
    }
    if (event.stackTrace != null) {
      messageString += '\nStack Trace:\n${event.stackTrace}';
    }

    final output = '$time [$className] $emoji ${event.level}: $messageString';

    return color != null ? [color(output)] : [output];
  }

  String _getLevelEmoji(Level level) {
    return {
          Level.trace: '🔍',
          Level.debug: '🐛',
          Level.info: 'ℹ️',
          Level.warning: '⚠️',
          Level.error: '⛔',
          Level.fatal: '💀',
        }[level] ??
        '📝';
  }

  String Function(String) _getLevelColor(Level level) {
    return ({
              Level.trace: AnsiColor.fg(AnsiColor.grey(0.5)),
              Level.debug: const AnsiColor.fg(12),
              Level.info: const AnsiColor.fg(81),
              Level.warning: const AnsiColor.fg(208),
              Level.error: const AnsiColor.fg(196),
              Level.fatal: const AnsiColor.fg(199),
            }[level] ??
            const AnsiColor.fg(255))
        .call;
  }
}

// 3. JSON Format Printer
class JsonLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [
      jsonEncode({
        'timestamp': DateTime.now().toIso8601String(),
        'level': event.level.toString(),
        'message': event.message.toString(),
        'error': event.error?.toString(),
        'stackTrace': event.stackTrace?.toString(),
      }),
    ];
  }
}

// 4. Compact Single Line Printer
class CompactLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [
      // ignore: no_adjacent_strings_in_list
      '${DateTime.now().toString().split('.').first} '
          '${event.level.toString().padRight(7)} '
          '${event.message}'
    ];
  }
}

// 5. Combined Printer (Multiple Formats)
class MultiFormatPrinter extends LogPrinter {
  MultiFormatPrinter(this.printers);

  final List<LogPrinter> printers;

  @override
  List<String> log(LogEvent event) {
    final outputs = <String>[];
    for (final printer in printers) {
      outputs.addAll(printer.log(event));
    }
    return outputs;
  }
}

// Usage Example
void main() {
  // 1. Using Custom Pretty Printer
  final prettyLogger = Logger(
    printer: CustomPrettyPrinter(
      methodCount: 2,
      lineLength: 110,
      colors: true,
    ),
  );

  // 2. Using Custom Format Printer
  final customLogger = Logger(
    printer: CustomLogPrinter(
      className: 'MyApp',
    ),
  );

  // 3. Using JSON Printer
  final jsonLogger = Logger(
    printer: JsonLogPrinter(),
  );

  // 4. Using Compact Printer
  final compactLogger = Logger(
    printer: CompactLogPrinter(),
  );

  // 5. Using Combined Printer
  final multiLogger = Logger(
    printer: MultiFormatPrinter([
      CustomLogPrinter(className: 'MyApp'),
      JsonLogPrinter(),
    ]),
  );

  // Example usage
  try {
    throw Exception('Test error');
  } catch (e, s) {
    prettyLogger.e('Error occurred ', error: e, stackTrace: s);
    customLogger.e('Error occurred', error: e, stackTrace: s);
    jsonLogger.e('Error occurred', error: e, stackTrace: s);
    compactLogger.e('Error occurred', error: e);
    multiLogger.e('Error occurred', error: e, stackTrace: s);
  }
}

// Enhanced Error Handler with Custom Logger
class EnhancedErrorHandler {
  EnhancedErrorHandler() {
    _logger = Logger(
      printer: CustomPrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
      ),
    );
  }
  late final Logger _logger;

  Future<void> handleError(
    dynamic error,
    StackTrace stackTrace,
    String context,
  ) async {
    try {
      _logger.e(
        'Error in $context',
        error: error,
        stackTrace: stackTrace,
      );
    } catch (e, s) {
      _logger.f(
        'Error handler failed',
        error: e,
        stackTrace: s,
      );
    }
  }
}
