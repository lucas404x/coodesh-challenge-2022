import 'package:intl/intl.dart';

String fromNumberToPriceFormatted(double price) {
  return NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$').format(price);
}