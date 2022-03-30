import 'package:intl/intl.dart';

class AddTextDateFormatter {
  ///find the current date and time.
  DateTime now = DateTime.now();
  currentDate() {
    final outputDate = DateFormat.yMMMMEEEEd().format(now);
    return outputDate;
  }

  currentTime() {
    final outputTime = DateFormat.jms().format(now);
    return outputTime;
  }

  ///end for date and time.
}
