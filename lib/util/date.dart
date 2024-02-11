import 'package:intl/intl.dart';

enum DateFormatType { date, dateTime, dbFormat }

String formatFromDateTime(DateTime dateTime, DateFormatType formatType) {
  switch (formatType) {
    case DateFormatType.date:
      return DateFormat('yyyy/MM/dd').format(dateTime);
    case DateFormatType.dateTime:
      return DateFormat('yyyy/MM/dd HH:mm').format(dateTime);
    case DateFormatType.dbFormat:
      return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    default:
      return DateFormat('yyyy/MM/dd HH:mm').format(dateTime);
  }
}
