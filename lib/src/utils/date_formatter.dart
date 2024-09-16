import 'package:intl/intl.dart';

class DateFormatter {
  static String dateID(DateTime date) {
    String formattedDate = DateFormat.yMMMMEEEEd('id').format(date);
    return formattedDate;
  }

  static String timeID(DateTime date) {
    String formattedTime = DateFormat.jm('id').format(date);
    return formattedTime;
  }

  static String dateTimeID(DateTime date) {
    String formattedDateTime = DateFormat.yMMMEd('id').add_jm().format(date);
    return formattedDateTime;
  }
}
