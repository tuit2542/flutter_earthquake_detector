
import 'package:intl/intl.dart';

String getFormattedDate(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

String getCurrentTimeToString() {
  DateTime now = DateTime.now();

  String formattedNow = getFormattedDate(now);

  return formattedNow;
}

String getPastTimeToString({
  Duration duration = const Duration(hours: 24),
}) {
  DateTime now = DateTime.now();

  DateTime pastHours = now.subtract(duration);

  String formattedPast24Hours = getFormattedDate(pastHours);

  return formattedPast24Hours;
}

