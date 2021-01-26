import 'package:intl/intl.dart';

class ConvertToDate {
 static convertToDate(String date) {
    DateTime dateTimeDate = DateTime.parse(date);
    String stringDate = DateFormat.yMMMd().format(dateTimeDate);

    return stringDate.toString();
  }
}