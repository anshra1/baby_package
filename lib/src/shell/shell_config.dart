import 'package:stack_trace/stack_trace.dart';

/// Configuration options for ShellFunctions behavior
class ShellConfig {
  /// Enable detailed logging of operations and errors
  static bool enableDetailedLogs = true;

  /// Whether to throw exceptions or handle them internally
  static bool throwOnError = false;

  /// Default timeout duration for async operations
  static Duration defaultTimeout = const Duration(seconds: 30);

  /// Custom error callback for external error handling
  static void Function(Object error, Chain chain)? errorCallback;
}