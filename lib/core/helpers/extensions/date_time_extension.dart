import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get greeting {
    final hour = this.hour;

    if (hour < 12) {
      return "Good Morning";
    } else {
      return "Good Evening";
    }
  }

  String toFriendlyString() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(year, month, day);

    final timeFormat = DateFormat('h:mm a');

    if (target == today) {
      return "Today ${timeFormat.format(this)}";
    } else if (target == today.subtract(const Duration(days: 1))) {
      return "Yesterday ${timeFormat.format(this)}";
    } else {
      final dayName = DateFormat('EEEE').format(this);
      return "$dayName ${timeFormat.format(this)}";
    }
  }
}
