

import 'package:intl/intl.dart';

class DateMethods {
  static String formatToDate(String? date) {
    DateTime? dateTime = DateTime.tryParse(date.toString());
    return dateTime != null
        ? DateFormat(
            'yyyy-MM-dd',
            'en',
          ).format(dateTime)
        : "";
  }

 
}