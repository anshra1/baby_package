// ignore_for_file: use_super_parameters

import 'package:baby_package/src/enum/error_catogory.dart';
import 'package:baby_package/src/enum/error_severity.dart';
import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable implements Exception {
  const AppException({
    required this.debugCode,
    required this.errorCode,
    required this.showUImessage,
    required this.methodName,
    required this.dartError,
    required this.debugDetails,
    this.dartStackTrace,
    this.severity = ErrorSeverity.low,
    this.category = ErrorCategory.unknown,
    this.isRecoverable,
  });

  final dynamic dartError;
  final dynamic debugCode;
  final dynamic errorCode;
  final String? showUImessage;
  final String? debugDetails;
  final ErrorSeverity severity;
  final ErrorCategory category;
  final bool? isRecoverable;
  final String methodName;
  final StackTrace? dartStackTrace;

  @override
  List<Object?> get props => [
        debugCode,
        showUImessage,
        debugDetails,
        dartStackTrace,
        severity,
        category,
        isRecoverable,
        methodName,
        dartError,
      ];

  @override
  String toString() {
    final timestamp = DateTime.now().toIso8601String();
    final dartStackTraceFormattedStack =
        dartStackTrace != null ? dartStackTrace! : 'No stack trace available';

    return '''
----------------------------------------
Time: $timestamp
Method: $methodName
Code: $errorCode
Category: ${category.name}
Severity: ${severity.name}
Is Recoverable: ${isRecoverable ?? 'Unknown'}
UI Message: ${showUImessage ?? 'No message provided'}
Debug Details: ${debugDetails ?? 'None'}
Debug Code: $debugCode
Dart Error: $dartError
DartStackTrace:
$dartStackTraceFormattedStack
----------------------------------------
''';
  }

  /// Creates a map representation of the exception
  // Map<String, dynamic> toJson() => {
  //       'timestamp': DateTime.now().toIso8601String(),
  //       'methodName': methodName,
  //       'errorCode': errorCode.toString(),
  //       'category': category.name,
  //       'severity': severity.name,
  //       'isRecoverable': isRecoverable,
  //       'message': showUImessage,
  //       'debugDetails': debugDetails,
  //       'debugCode': debugCode.toString(),
  //       'stackTrace': dartStackTrace?.toString(),
  //     };
}

class ServerException extends AppException {
  const ServerException({
    required dynamic errorCode,
    required dynamic debugCode,
    required String methodName,
    required dynamic dartError,
    String? showUImessage,
    ErrorCategory errorCategory = ErrorCategory.unknown,
    String? debugDetails,
    StackTrace? dartStackTrace,
    ErrorSeverity severity = ErrorSeverity.low,
    bool? isRecoverable,
  }) : super(
          dartError: dartError,
          debugCode: debugCode,
          methodName: methodName,
          errorCode: errorCode,
          showUImessage: showUImessage,
          debugDetails: debugDetails,
          dartStackTrace: dartStackTrace,
          severity: severity,
          category: errorCategory,
          isRecoverable: isRecoverable,
        );
}

class CacheException extends AppException {
  const CacheException({
    required dynamic errorCode,
    required String debugCode,
    required String showUImessage,
    required String methodName,
    required dynamic dartError,
    ErrorCategory errorCategory = ErrorCategory.sharedPreferences,
    String? debugDetails,
    StackTrace? stackTrace,
    ErrorSeverity severity = ErrorSeverity.medium,
    bool? isRecoverable,
  }) : super(
          dartError: dartError,
          debugCode: debugCode,
          methodName: methodName,
          errorCode: errorCode,
          showUImessage: showUImessage,
          debugDetails: debugDetails,
          dartStackTrace: stackTrace,
          severity: severity,
          category: errorCategory,
          isRecoverable: isRecoverable,
        );
}

class StorageException extends AppException {
  const StorageException({
    required dynamic dartError,
    required super.errorCode,
    required String super.debugCode,
    required String super.showUImessage,
    required super.methodName,
    ErrorCategory errorCategory = ErrorCategory.sharedPreferences,
    super.debugDetails,
    super.dartStackTrace,
    super.severity = ErrorSeverity.medium,
    super.isRecoverable,
  }) : super(
          dartError: dartError,
          category: errorCategory,
        );
}

class NetworkException extends AppException {
  const NetworkException({
    required dynamic errorCode,
    required String debugCode,
    required String showUImessage,
    required String methodName,
    String? debugDetails,
    StackTrace? stackTrace,
    ErrorSeverity severity = ErrorSeverity.medium,
    bool? isRecoverable,
    dynamic dartError = '',
  }) : super(
          dartError: dartError,
          errorCode: errorCode,
          debugCode: debugCode,
          methodName: methodName,
          showUImessage: showUImessage,
          debugDetails: debugDetails,
          dartStackTrace: stackTrace,
          severity: severity,
          category: ErrorCategory.network,
          isRecoverable: isRecoverable,
        );
}

class NetworkTimeOutException extends AppException {
  const NetworkTimeOutException({
    required dynamic dartError,
    required dynamic errorCode,
    required String debugCode,
    required String showUImessage,
    required String methodName,
    ErrorCategory errorCategory = ErrorCategory.network,
    String? debugDetails,
    StackTrace? stackTrace,
    ErrorSeverity severity = ErrorSeverity.medium,
    bool? isRecoverable,
  }) : super(
          dartError: dartError,
          errorCode: errorCode,
          debugCode: debugCode,
          methodName: methodName,
          showUImessage: showUImessage,
          debugDetails: debugDetails,
          dartStackTrace: stackTrace,
          severity: severity,
          category: errorCategory,
          isRecoverable: isRecoverable,
        );
}

class ValidationException extends AppException {
  const ValidationException({
    required dynamic debugCode,
    required String methodName,
    required dynamic errorCode,
    String? showUImessage,
    ErrorCategory errorCategory = ErrorCategory.unknown,
    String? debugDetails,
    StackTrace? dartStackTrace,
    ErrorSeverity severity = ErrorSeverity.low,
    bool? isRecoverable,
    dynamic dartError = '',
  }) : super(
          dartError: dartError,
          debugCode: debugCode,
          methodName: methodName,
          errorCode: errorCode,
          showUImessage: showUImessage,
          debugDetails: debugDetails,
          dartStackTrace: dartStackTrace,
          severity: severity,
          category: errorCategory,
          isRecoverable: isRecoverable,
        );
}

class PermissionDeniedException extends AppException {
  const PermissionDeniedException({
    required dynamic debugCode,
    required String methodName,
    required dynamic errorCode,
    String? showUImessage,
    ErrorCategory errorCategory = ErrorCategory.permissionDenied,
    String? debugDetails,
    StackTrace? dartStackTrace,
    ErrorSeverity severity = ErrorSeverity.low,
    bool? isRecoverable,
    dynamic dartError = '',
  }) : super(
          dartError: dartError,
          debugCode: debugCode,
          methodName: methodName,
          errorCode: errorCode,
          showUImessage: showUImessage,
          debugDetails: debugDetails,
          dartStackTrace: dartStackTrace,
          severity: severity,
          category: errorCategory,
          isRecoverable: isRecoverable,
        );
}

class UnknownException extends AppException {
  const UnknownException({
    required dynamic dartError,
    required dynamic errorCode,
    required dynamic debugCode,
    required String methodName,
    String? showUImessage,
    ErrorCategory errorCategory = ErrorCategory.unknown,
    String? debugDetails,
    StackTrace? dartStackTrace,
    ErrorSeverity severity = ErrorSeverity.low,
    bool? isRecoverable,
  }) : super(
          dartError: dartError,
          debugCode: debugCode,
          methodName: methodName,
          errorCode: errorCode,
          showUImessage: showUImessage,
          debugDetails: debugDetails,
          dartStackTrace: dartStackTrace,
          severity: severity,
          category: errorCategory,
          isRecoverable: isRecoverable,
        );
}
