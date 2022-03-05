import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String fromTimestampToDateFormatted(Timestamp timestamp) {
  String dateFormatted = DateFormat.yMd().format(timestamp.toDate().toLocal());
  return dateFormatted.splitMapJoin(
    '/',
    onMatch: (m) {
      return m[0] ?? '';
    },
    onNonMatch: (n) {
      return n.padLeft(2, '0');
    },
  );
}
