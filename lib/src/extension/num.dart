extension NumExtensions on num {
  String formatCurrency([String symbol = r'$']) {
    // This is a simple implementation. Consider using intl package for more robust formatting
    return '$symbol${toStringAsFixed(2)}';
  }

  String formatCompact() {
    if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    }
    return toString();
  }

  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get seconds => Duration(seconds: toInt());
  Duration get minutes => Duration(minutes: toInt());
  Duration get hours => Duration(hours: toInt());
  Duration get days => Duration(days: toInt());
}
