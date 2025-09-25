extension DateTimeExtensions on DateTime {
  String get greeting {
    final hour = this.hour;

    if (hour < 12) {
      return "Good Morning";
    } else {
      return "Good Evening";
    }
  }
}
