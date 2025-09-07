import 'dart:developer';
import 'dart:io';

import 'package:logger/logger.dart';

class DeveloperConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    final StringBuffer buffer = StringBuffer();
    event.lines.forEach(buffer.writeln);
    log(buffer.toString());
  }
}

final printLog = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: false,
  ),
  output: Platform.isIOS ? MultiOutput([DeveloperConsoleOutput()]) : null,
  filter: ProductionFilter(),
);
