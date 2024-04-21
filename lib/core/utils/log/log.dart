import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Logger for the terminal more visible and color full
/// very handy for debugging

class Log {
  static final Logger _logger = Logger();

  static void error(dynamic message) {
    if (kDebugMode) {
      _logger.e(message);
    }
  }

  static void warning(dynamic message) {
    if (kDebugMode) {
      _logger.w(message);
    }
  }

  static void debug(dynamic message) {
    if (kDebugMode) {
      _logger.d(message);
    }
  }

  static void info(dynamic message) {
    if (kDebugMode) {
      final logger = Logger();
      logger.i(message);
    }
  }
}
