import 'package:stack_trace/stack_trace.dart';

extension ReadableStackTrace on StackTrace {
  /// Converts the current StackTrace to a readable format
  String get readable {
    return Trace.format(Trace.from(this));
  }

  /// Converts the current StackTrace to a terse readable format
  String get terseReadable {
    return Trace.from(this).terse.toString();
  }
}
