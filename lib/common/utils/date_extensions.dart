import 'package:dart_date/dart_date.dart';
import 'package:easy_localization/easy_localization.dart';

extension DateExtensions on DateTime {
  String parseFullMonthDay({String locale = 'ru_RU'}) {
    return DateFormat('dd MMMM', locale).format(this);
  }
}

extension DateStringExtensions on String {
  DateTime parseUtc() {
    if (split('').lastOrNull?.toLowerCase() != 'z') {
      return DateTime.parse('${this}z');
    }
    return DateTime.parse(this);
  }

  DateTime parse() {
    return DateTime.parse(this);
  }

  String parseFullMonthDay({String locale = 'ru_RU'}) {
    return DateTime.parse(this).format('dd MMMM', locale);
  }

  String parseTime({String locale = 'ru_RU'}) {
    return DateTime.parse(this).format('HH:mm', locale);
  }
}
