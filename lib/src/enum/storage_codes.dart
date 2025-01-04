enum SharedPrefCode {
  readError('READ_ERROR'),
  writeError('WRITE_ERROR'),
  typeError('TYPE_ERROR'),
  notFound('NOT_FOUND'),
  permissionError('PERMISSION_ERROR'),
  initError('INIT_ERROR'),
  diskError('DISK_ERROR'),
  stateError('STATE_ERROR'),
  fileSystemError('FILESYSTEM_ERROR'),
  formatError('FORMAT_ERROR'),
  serializationError('SERIALIZATION_ERROR'),
  invalidArgument('INVALID_ARGUMENT'),
  unsupportedOperation('UNSUPPORTED_OPERATION'),
  rangeError('RANGE_ERROR'),
  outOfMemory('OUT_OF_MEMORY'),
  concurrencyError('CONCURRENCY_ERROR'),
  unknown('UNKNOWN');

  const SharedPrefCode(this.code);
  final String code;
}
