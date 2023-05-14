//common function
 import 'package:intl/intl.dart';

String formatDate(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    DateTime now = DateTime.now();

    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return 'Today';
    } else if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day + 1) {
      return 'Tomorrow';
    } else {
      final DateFormat formatter = DateFormat('d MMM yyyy');
      final String formattedDate = formatter.format(dateTime);
      return formattedDate;
    }
  }