import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get toSimpleDate => DateFormat('dd/MM/yyyy').format(toLocal());
  String get toTimeAndDate => DateFormat('dd/MM/yyyy HH:mm').format(toLocal());
}
