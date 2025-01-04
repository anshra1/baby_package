// // Package imports:

// import 'package:my_widgets/src/exception/exception.dart';
// import 'package:my_widgets/src/logger/debug_logger.dart';

// class ExceptionThrower {
//   ExceptionThrower._();

//   static Never throwUnknownExceptionWithFirebase({
//     required StackTrace stackTrace,
//     required String methodName,
//     required dynamic dartError,
//   }) {
//     if (dartError is AppException) {
//       DebugLogger.instance.error(dartError.toString());
//       throw dartError; // Rethrow if already an AppException
//     }

//     if (dartError is FirebaseException) {
//       throw firebaseServerException(
//         dartStackTrace: stackTrace,
//         methodName: methodName,
//         firebaseException: dartError,
//       );
//     }

//     throw unknownException(
//       dartError: dartError,
//       stackTrace: stackTrace,
//       methodName: methodName,
//     );
//   }

//   static Never throwExceptionWithCatch({
//     required dynamic error,
//     required StackTrace stackTrace,
//     required String methodName,
//   }) {
//     if (error is AppException) {
//       DebugLogger.instance.error(error.toString());
//       throw error; // Rethrow if already an AppException
//     }

//     throw unknownException(
//       dartError: error,
//       stackTrace: stackTrace,
//       methodName: methodName,
//     );
//   }

//   static Never firebaseServerException({
//     required FirebaseException firebaseException,
//     required StackTrace dartStackTrace,
//     required String methodName,
//   }) {
//     final serverity = FirebaseErrorConfig.getSeverity(firebaseException);
//     final errorCode = FirebaseErrorConfig.getErrorCode(firebaseException);
//     final isRecoverable = FirebaseErrorConfig.isRecoverable(firebaseException);
//     final technicalMessage = FirebaseErrorConfig.technicalMessage(firebaseException);
//     final category = FirebaseErrorConfig.getCategory(firebaseException);

//     final serverException = ServerException(
//       errorCode: errorCode,
//       debugCode: firebaseException.code,
//       showUImessage: firebaseException.message ?? 'Firebase Error Occurred',
//       debugDetails:
//           'Custom Details $technicalMessage \n Firebase StackTrace: ${firebaseException.stackTrace}',
//       severity: serverity,
//       isRecoverable: isRecoverable,
//       dartError: 'Dart Error is FirebaseException',
//       dartStackTrace: dartStackTrace,
//       methodName: methodName,
//       errorCategory: category,
//     );
//     DebugLogger.instance.error(serverException.toString());
//     throw serverException;
//   }

//   static Never unknownException({
//     required dynamic dartError,
//     required String methodName,
//     StackTrace? stackTrace,
//   }) {
//     if (dartError is AppException) {
//       throw dartError; // Rethrow if already an AppException
//     }

//     final unknownExcetion = UnknownException(
//       debugCode: 'Unknown Error',
//       dartError: dartError,
//       showUImessage: Strings.unknownError,
//       dartStackTrace: stackTrace,
//       errorCode: ErrorCode.unknown,
//       methodName: methodName,
//     );
//     DebugLogger.instance.error(unknownExcetion.toString(), dartError, stackTrace);
//     throw unknownExcetion;
//   }

//   static Never validationException({
//     required dynamic debugCode,
//     required String methodName,
//     required String messsage,
//   }) {
//     final validationException = ValidationException(
//       debugCode: debugCode,
//       showUImessage: messsage,
//       methodName: methodName,
//       errorCode: ErrorCode.validation,
//     );
//     DebugLogger.instance.error(validationException.toString());
//     throw validationException;
//   }

//   static Never sharedPrefanceException(
//     dynamic dartError,
//     StackTrace dartStackTrace, {
//     required String methodName,
//     required String fallbackMessage,
//     ErrorSeverity? errorSeverity,
//   }) {
//     final storageDebugCode = SharedPrefErrorConfig.getStorageDebugCode(dartError);
//     final severity = SharedPrefErrorConfig.getSeverity(storageDebugCode);
//     final isRecoverable = SharedPrefErrorConfig.isRecoverable(storageDebugCode);
//     final errorCode =
//         SharedPrefErrorConfig.convertStorageErrorToErrorCode(storageDebugCode);
//     final debugDetails = SharedPrefErrorConfig.getDebugErrorMessage(
//       code: storageDebugCode,
//       fallbackMessage: fallbackMessage,
//     );
//     final userUIMessage = SharedPrefErrorConfig.getUserMessage(errorCode);

//     final storageException = StorageException(
//       dartError: dartError,
//       showUImessage: userUIMessage,
//       debugDetails: debugDetails,
//       debugCode: storageDebugCode.toString(),
//       methodName: methodName,
//       dartStackTrace: dartStackTrace,
//       errorCode: errorCode,
//       severity: errorSeverity ?? severity,
//       isRecoverable: isRecoverable,
//     );

//     // Log full details for debugging
//     DebugLogger.instance.error(
//       ErrorFormatter.format(storageException, dartStackTrace),
//     );

//     throw storageException;
//   }
// }
