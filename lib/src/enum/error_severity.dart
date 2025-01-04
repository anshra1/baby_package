enum ErrorSeverity {
  low(0),
  medium(1),
  high(2),
  fatal(3),
  unknown(4);

  const ErrorSeverity(this.value);
  final int value;
}
