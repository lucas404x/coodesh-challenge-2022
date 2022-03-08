import 'package:intl/intl.dart';

String fromNumberToPriceFormatted(double price) {
  return NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$').format(price);
}

double fromPriceFormattedToNumber(String priceFormatted) {
  double value = NumberFormat.currency(locale: 'pt-BR', name: '')
      .parse(priceFormatted)
      .toDouble();

  return value;
}
