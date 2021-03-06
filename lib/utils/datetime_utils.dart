DateTime transDateTime(DateTime dateTime, String utcOffset) {

  if (utcOffset.startsWith('-')) {
    utcOffset = utcOffset.replaceFirst('-', '+');
  } else {
    utcOffset = utcOffset.replaceFirst('+', '-');
  }

  String utcString = '${dateTime.year}-'
      '${dateTime.month.toString().padLeft(2, '0')}-'
      '${dateTime.day.toString().padLeft(2, '0')}T'
      '${dateTime.hour.toString().padLeft(2,'0')}:'
      '${dateTime.minute.toString().padLeft(2, '0')}:'
      '${dateTime.second.toString().padLeft(2, '0')}'
      '$utcOffset';

  DateTime res = DateTime.parse(utcString);

  return res;
}