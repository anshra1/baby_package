// ignore_for_file: avoid_redundant_argument_values, prefer_final_in_for_each

import 'package:baby_package/src/logger/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class DebugLogger {
  factory DebugLogger() => instance;

  DebugLogger._internal() {
    _logger = Logger(
      printer: CustomPrettyPrinter(
        methodCount: 2, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls if stacktrace is provided
        lineLength: 120, // Width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        // Should each log print contain a timestamp
      ),
      filter: DevelopmentFilter(), // Only log in debug mode
    );
  }

  static DebugLogger instance = DebugLogger._internal();

  late final Logger _logger;

  // Trace level for detailed debugging
  void trace(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (!kDebugMode) return;
    _logger.t(message);
  }

  // Debug level for development information
  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (!kDebugMode) return;
    _logger.d(message);
  }

  // Info level for general information
  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (!kDebugMode) return;
    _logger.i(message);
  }

  // Warning level for potentially harmful situations
  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (!kDebugMode) return;
    _logger.w(message);
  }

  // Error level for errors that need attention
  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (!kDebugMode) return;
    _logger.e(message);
  }

  // Fatal level for severe errors that might cause application crash
  void fatal(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (!kDebugMode) return;
    _logger.f(message);
  }

  // Performance logs
  void logPerformance(String operation, int milliseconds) {
    if (!kDebugMode) return;
    _logger.d('⚡ Performance: $operation took ${milliseconds}ms');
  } // Navigation logs

  void logNavigation(
    String from,
    String to, {
    Map<String, dynamic>? arguments,
  }) {
    if (!kDebugMode) return;
    _logger.i(
      '🔀 Navigation: $from ➡️ $to${arguments != null ? '\nArguments: $arguments' : ''}',
    );
  } // State management logs

  void logState(String message, {String? from, Map<String, dynamic>? data}) {
    if (!kDebugMode) return;
    final source = from != null ? '[$from]' : '';
    _logger.i('🔄 State $source: $message ${data != null ? '\nData: $data' : ''}');
  }

  void logResponse(String url, int statusCode, dynamic body) {
    if (!kDebugMode) return;
    _logger.d('⬅️ RESPONSE: $url\nStatus: $statusCode\nBody: $body');
  } // Network related logs

  void logRequest(String url, {Map<String, dynamic>? headers, dynamic body}) {
    if (!kDebugMode) return;
    _logger.d(
      '➡️ REQUEST: $url',
    );
    if (headers != null) _logger.d('Headers: $headers');
    if (body != null) _logger.d('Body: $body');
  }

  void close() {
    _logger.close();
  }
}

// Custom log filter to control log output based on environment
class CustomLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (kReleaseMode) {
      // In release mode, only show warnings and above
      return event.level.index >= Level.warning.index;
    }
    // In debug mode, show all logs
    return true;
  }
}

// Custom file output to save logs to file
class FileOutput extends LogOutput {
  @override
  Future<void> output(OutputEvent event) async {
    // Implement file writing logic here
    // You can use your SharedPreferences or local storage
    // for (var line in event.lines) {
    //   // Add timestamp
    //   final timestamp = DateTime.now().toIso8601String();
    // //  final logLine = '$timestamp: $line\n';

    //   // Save to file or storage
    //   // await _writeToFile(logLine);
    // }
  }
}

// Custom output that can handle multiple outputs
class MultiOutput extends LogOutput {
  MultiOutput(this.outputs);

  final List<LogOutput> outputs;

  @override
  void output(OutputEvent event) {
    for (final output in outputs) {
      output.output(event);
    }
  }
}

// void initLogger() {
//   final GetIt sl = GetIt.instance;

//   // Register logger as a singleton
//   sl.registerLazySingleton<AppLogger>(
//     () => AppLogger(),
//   );
// }

// Example repository wrapper with logging
abstract class BaseRepository {
  BaseRepository(this._logger);

  final DebugLogger _logger;

  Future<T> safeCall<T>({
    required String operation,
    required Future<T> Function() call,
  }) async {
    try {
      _logger.debug('Starting $operation');
      final result = await call();
      _logger.debug('Completed $operation successfully');
      return result;
    } catch (error, stackTrace) {
      _logger.error(
        'Error in $operation',
        error,
        stackTrace,
      );
      rethrow;
    }
  }
}
