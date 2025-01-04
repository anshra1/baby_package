// ignore_for_file: avoid_print

import 'dart:async';

import 'package:baby_package/src/failures/failures_barrel.dart';
import 'package:baby_package/src/shell/shell_config.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

class Config {
  static const bool isDebug = true;
}

class ShellFunctions {
  /// Execute a synchronous operation with error handling
  static T executeOperation<T>(T Function() action) {
    return _runWithCapture<T>(() {
      return _executeInternalOperation(action);
    });
  }

  /// Execute an asynchronous operation with error handling
  static Future<T> executeAsyncOperation<T>(Future<T> Function() action) async {
    return _runWithCaptureAsync<T>(() {
      return _executeInternalOperationAsync(action);
    });
  }

  static Future<Either<Failure, T>> executeWithEither<T>({
    required Future<T> Function() action,
    required Failure Function(Object error)? customFailure,
  }) async {
    try {
      final result = await executeAsyncOperation(action);
      return Right(result);
    } catch (e, stackTrace) {
      final chain = Chain.parse(stackTrace.toString());
      debugError(e, chain);

      // Use custom failure if provided, otherwise default error
      final failure = customFailure?.call(e);
      return Left(failure!);
    }
  }

  /// Execute an operation with timeout
  static Future<T> executeWithTimeout<T>(
    Future<T> Function() action, {
    Duration? timeout,
  }) async {
    try {
      return await executeAsyncOperation(action).timeout(
        timeout ?? ShellConfig.defaultTimeout,
        onTimeout: () {
          throw TimeoutException(
            'Operation timed out after ${timeout?.inSeconds ?? ShellConfig.defaultTimeout.inSeconds} seconds',
          );
        },
      );
    } catch (e) {
      debugError(e, Chain.current());
      return _defaultReturnValue<T>();
    }
  }

  /// Internal synchronous execution
  static T _executeInternalOperation<T>(T Function() action) {
    return action();
  }

  /// Internal asynchronous execution
  static Future<T> _executeInternalOperationAsync<T>(
    Future<T> Function() action,
  ) async {
    return action();
  }

  /// Error capture wrapper for sync operations
  static T _runWithCapture<T>(T Function() action) {
    if (Config.isDebug) {
      return Chain.capture(
        () => action(),
        onError: (error, chain) {
          debugError(error, chain);
          _defaultReturnValue<T>();
        },
      );
    } else {
      return action();
    }
  }

  /// Error capture wrapper for async operations
  static Future<T> _runWithCaptureAsync<T>(Future<T> Function() action) async {
    if (Config.isDebug) {
      return await Chain.capture(
        () async => action(),
        onError: (error, chain) {
          debugError(error, chain);
          _defaultReturnValue<T>();
        },
      );
    } else {
      return action();
    }
  }

  /// Enhanced error handling with logging
  static void debugError(Object error, Chain chain) {
    if (ShellConfig.enableDetailedLogs && kDebugMode) {
      print('=== Error Details ===');
      print('Timestamp: ${DateTime.now().toIso8601String()}');
      print('Error: $error');
      print('Error Type: ${error.runtimeType}');
      print('Stack Trace:');
      print(chain.terse);
      print('==================');
    }

    // Call custom error handler if provided
    ShellConfig.errorCallback?.call(error, chain);

    // Rethrow if configured to do so
    if (ShellConfig.throwOnError) {
      throw error;
    }
  }

  /// Provides type-safe default values for various types
  static T _defaultReturnValue<T>() {
    if (T == bool) return false as T;
    if (T == String) return '' as T;
    if (T == int) return 0 as T;
    if (T == double) return 0.0 as T;
    if (T == List<String>) return <String>[] as T;
    if (T == List) return <dynamic>[] as T;
    if (T == Map<String, dynamic>) return <String, dynamic>{} as T;
    if (T == Map) return <dynamic, dynamic>{} as T;
    if (T == Set) return <dynamic>{} as T;
    return null as T;
  }
}
