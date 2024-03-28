import 'package:intl/intl.dart';

extension RealFormat on num {
  String toReal() {
    final format = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return format.format(this);
  }
}
