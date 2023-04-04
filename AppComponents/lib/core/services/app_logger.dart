import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    printTime: true,
    methodCount: 4,
  ),
);

final loggerSimple = Logger(
  printer: SimplePrinter(
    printTime: true,
    colors: true,
  ),
);

final loggerNoStack = Logger(
  printer: PrettyPrinter(
    printTime: true,
    methodCount: 0,
  ),
);
