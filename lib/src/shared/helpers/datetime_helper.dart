import 'package:flutter_earthquake_detector/src/shared/helpers/enum.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  static String getFormattedDate(
    DateTime date, {
    TimeFormat format = TimeFormat.dateApi,
  }) {
    return DateFormat(format.value).format(date);
  }

  static String getFormattedTime(
    DateTime date, {
    TimeFormat format = TimeFormat.dateTimeApi,
  }) {
    return DateFormat(format.value).format(date);
  }

  static String getCurrentTimeToString() {
    DateTime now = DateTime.now();
    return getFormattedDate(now);
  }

  static String getPastTimeToString({
    Duration duration = const Duration(hours: 24),
  }) {
    DateTime pastTime = DateTime.now().subtract(duration);
    return getFormattedDate(pastTime);
  }
}
