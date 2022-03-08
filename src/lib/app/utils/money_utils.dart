import 'package:intl/intl.dart';

String fromNumberToPriceWithSymbol(double price) {
  return NumberFormat.currency(symbol: 'R\$').format(price);
}

String fromNumberToPriceFormatted(double price) {
  return NumberFormat.currency(name: '').format(price).trim();
}

double fromPriceFormattedToNumber(String priceFormatted) {
  return NumberFormat.currency().parse(priceFormatted).toDouble();
}
