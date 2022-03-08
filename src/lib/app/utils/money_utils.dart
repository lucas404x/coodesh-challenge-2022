import 'package:intl/intl.dart';

String fromNumberToPriceWithSymbol(double price) {
  return NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$').format(price);
}

String fromNumberToPriceFormatted(double price) {
  return NumberFormat.currency(locale: 'pt-BR', name: '').format(price).trim();
}

double fromPriceFormattedToNumber(String priceFormatted) {
  return NumberFormat.currency(
    locale: 'pt-BR',
  ).parse(priceFormatted).toDouble();
}
