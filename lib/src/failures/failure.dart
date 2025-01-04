// // Package imports:
// import 'package:debug_app_web/src/cores/enum/enum/error_catogory.dart';
// import 'package:debug_app_web/src/cores/enum/enum/error_severity.dart';
// import 'package:equatable/equatable.dart';

// abstract class Failure extends Equatable {
//   const Failure({
//     required this.message,
//     required this.code,
//     this.category = ErrorCategory.unknown,
//     this.severity = ErrorSeverity.low,
//     this.isRecoverable,
//   });

//   final String message;
//   final dynamic code;
//   final ErrorCategory category;
//   final ErrorSeverity severity;
//   final bool? isRecoverable;

//   @override
//   List<Object?> get props => [message, code];
// }

// class ServerFailure extends Failure {
//   const ServerFailure({
//     required super.message,
//     required super.code,
//     required super.category,
//     required super.isRecoverable,
//     required super.severity,
//   });
// }

// class StoreageFailure extends Failure {
//   const StoreageFailure({
//     required super.message,
//     required super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });
// }

// class CacheFailure extends Failure {
//   const CacheFailure({
//     required super.message,
//     required super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });
// }

// class AuthFailure extends Failure {
//   const AuthFailure({
//     required super.message,
//     required super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });
// }

// class NetworkFailure extends Failure {
//   const NetworkFailure({
//     required super.message,
//     required super.code,
//     required Object error,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });
// }

// class ValidationFailure extends Failure {
//   const ValidationFailure({
//     required super.message,
//     required super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });

//   @override
//   List<Object?> get props => [...super.props];
// }

// class TimeoutFailure extends Failure {
//   const TimeoutFailure({
//     required super.message,
//     required super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });

//   @override
//   List<Object?> get props => [...super.props];
// }

// class UnknownFailure extends Failure {
//   const UnknownFailure({
//     required super.message,
//     required super.code,
//     required super.category,
//     required super.isRecoverable,
//     required super.severity,
//   });
// }

// class PermissionDeniedFailure extends Failure {
//   const PermissionDeniedFailure({
//     required super.message,
//     required super.code,
//     required super.category,
//     required super.isRecoverable,
//     required super.severity,
//   });
// }

// class PlatformFailure extends Failure {
//   const PlatformFailure({
//     required super.message,
//     required super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });
// }
