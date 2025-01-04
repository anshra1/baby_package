// extension DateTimeExtensions on DateTime {
//   bool isSameDay(DateTime other) {
//     return year == other.year && month == other.month && day == other.day;
//   }

//   bool get isToday {
//     final now = DateTime.now();
//     return isSameDay(now);
//   }

//   bool get isTomorrow {
//     final tomorrow = DateTime.now().add(const Duration(days: 1));
//     return isSameDay(tomorrow);
//   }

//   bool get isYesterday {
//     final yesterday = DateTime.now().subtract(const Duration(days: 1));
//     return isSameDay(yesterday);
//   }

//   String get timeAgo {
//     final now = DateTime.now();
//     final difference = now.difference(this);

//     if (difference.inDays > 365) {
//       final years = (difference.inDays / 365).floor();
//       return '$years year${years == 1 ? '' : 's'} ago';
//     } else if (difference.inDays > 30) {
//       final months = (difference.inDays / 30).floor();
//       return '$months month${months == 1 ? '' : 's'} ago';
//     } else if (difference.inDays > 0) {
//       return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
//     } else if (difference.inHours > 0) {
//       return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
//     } else if (difference.inMinutes > 0) {
//       return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
//     } else {
//       return 'Just now';
//     }
//   }

//   String format([String pattern = 'MMM d, yyyy']) {
//     // This is a simple implementation. Consider using intl package for more robust formatting
//     final months = [
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//       'Aug',
//       'Sep',
//       'Oct',
//       'Nov',
//       'Dec',
//     ];

//     pattern = pattern.replaceAll('MMM', months[month - 1]);
//     pattern = pattern.replaceAll('yyyy', year.toString());
//     pattern = pattern.replaceAll('d', day.toString());

//     return pattern;
//   }
// }
