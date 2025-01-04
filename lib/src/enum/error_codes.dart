enum ErrorCode {
  // HTTP Status Codes
  badRequest, // 400
  unauthorized, // 401
  forbidden, // 403
  notFound, // 404
  serverError, // 500

  // Authentication Errors
  userNotFound,
  wrongPassword,
  emailInUse,
  weakPassword,
  invalidEmail,
  authGeneric,

  // firebase
  authentication,
  firestoreClient,
  firebaseStorage,
  firebaseCore,
  firebaseMessaging,
  firebaseCrashlytics,
  firebaseAnalytics,

  // Network Errors
  noInternet,
  timeOut,
  networkError,
  connectionLost,

  // Server Errors
  serverGeneric,

  // Custom Errors
  notFoundPasscode,
  unknown,

  validation,

  // Local Storage User Actions
  localStorageError, // Generic "Please try again later"
  storageFull, // "Please free up space on your device"
  storagePermission, // "Please grant storage permission in settings"
  appRestart, // "Please restart the app"
  appDataCorrupted, // "Please clear app data or reinstall"
}
