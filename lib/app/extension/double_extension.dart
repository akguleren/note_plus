import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String toFormattedDouble() {
    final formatter = NumberFormat.currency(locale: 'tr_TR', symbol: '');
    return formatter.format(this).trim();
  }
}
