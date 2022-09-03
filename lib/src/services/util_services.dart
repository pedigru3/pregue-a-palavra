import 'package:intl/intl.dart';

class UtilServices {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt-BR');

    return numberFormat.format(price);
  }
}
