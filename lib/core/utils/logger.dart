import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    dateTimeFormat: (time) {
      return '${time.day}.${time.month} ${time.hour}:${time.minute}';
    },
  ),
);
